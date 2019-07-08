import click
import json
import os

from configs.default import default_test_config,point_test_config
from experiment_utils import load_experiment, overwrite_dict
from rlkit.launchers.launcher_util import setup_logger, create_exp_name
import rlkit.torch.pytorch_util as ptu
from rlkit.torch.sac.sac import SoftActorCritic
from rlkit.torch.smm.smm_hook import SMMHook
from rlkit.torch.smm.historical_policies_hook import HistoricalPoliciesHook
import matplotlib.pyplot as plt
import numpy as np

def experiment(log_dir, variant_overwrite, cpu=False):
    if not cpu:
      ptu.set_gpu_mode(True)  # optionally set the GPU (default=False)

    # Load experiment from file.
    env, _, data, variant = load_experiment(log_dir, variant_overwrite)
    #assert all([a == b for a, b in zip(print(samples)env.sampled_goal, variant['env_kwargs']['goal_prior'])])

    # Set log directory.
    exp_id = 'eval/ne{}-mpl{}-{}-rs{}/nhp{}'.format(
        variant['algo_kwargs']['num_episodes'],
        variant['algo_kwargs']['max_path_length'],
        ','.join(variant_overwrite['env_kwargs']['shaped_rewards']),
        variant['algo_kwargs']['reward_scale'],
        variant['historical_policies_kwargs']['num_historical_policies'],
    )
    exp_id = create_exp_name(exp_id)
    out_dir = os.path.join(log_dir, exp_id)
    print('Logging to:', out_dir)
    setup_logger(log_dir=out_dir,
                 variant=variant,
                 snapshot_mode='none',
                 snapshot_gap=50,
    )

    # Load trained model from file.
    policy = data['policy']
    vf = data['vf']
    qf = data['qf']
    algorithm = SoftActorCritic(
        env=env,
        training_env=env,  # can't clone box2d env cause of swig
        save_environment=False,  # can't save box2d env cause of swig
        policy=policy,
        qf=qf,
        vf=vf,
        **variant['algo_kwargs'],
    )

    # Overwrite algorithm for p(z) adaptation (if model is SMM).
    if variant['intrinsic_reward'] == 'smm':
        discriminator = data['discriminator']
        density_model = data['density_model']
        SMMHook(
            base_algorithm=algorithm,
            discriminator=discriminator,
            density_model=density_model,
            **variant['smm_kwargs'])

    # Overwrite algorithm for historical averaging.
    if variant['historical_policies_kwargs']['num_historical_policies'] > 0:
        HistoricalPoliciesHook(
            base_algorithm=algorithm,
            log_dir=log_dir,
            **variant['historical_policies_kwargs'],
        )

    algorithm.to(ptu.device)
    #algorithm.train()
    samples = algorithm.get_eval_paths()
    #for path in samples:
    #    print(path['observations'])

    #plt.figure()
    #plt.plot(samples[0]['observations'][:, 0], samples[0]['observations'][:, 1])
    #plt.plot(3, 2)
    #plt.show()
    print(samples[0]['observations'])
    i=0
    for path in samples:

        np.save('./outtem/out%i.npy'%i,path['observations'])
        i = i+1


@click.command()
@click.argument('log-dir', default=None)
@click.option('--config', default='configs/test_no_ha_point.json', help="Test config file")
@click.option('--cpu', default=False, is_flag=True, help="Run on CPU")


def main(log_dir, config, cpu):
    variant = point_test_config
    if config:
        with open(os.path.join(config)) as f:
            exp_params = json.load(f)
        overwrite_dict(variant, exp_params)

    experiment(log_dir, variant, cpu=cpu)


if __name__ == "__main__":
    main()
