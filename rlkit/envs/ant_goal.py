import numpy as np

from rlkit.envs.ant_multitask_base import MultitaskAntEnv
#from . import register_env


# Copy task structure from https://github.com/jonasrothfuss/ProMP/blob/master/meta_policy_search/envs/mujoco_envs/ant_rand_goal.py
#@register_env('ant-goal')
class AntGoalEnv(MultitaskAntEnv):
    def __init__(self, task={}, n_tasks=2, randomize_tasks=True, **kwargs):
        super(AntGoalEnv, self).__init__(task, n_tasks, **kwargs)

    def step(self, action):
        self.do_simulation(action, self.frame_skip)
        xposafter = np.array(self.get_body_com("torso"))

        goal_reward = -np.sum(np.abs(xposafter[:2] - self._goal)) # make it happy, not suicidal

        ctrl_cost = .1 * np.square(action).sum()
        contact_cost = 0.5 * 1e-3 * np.sum(
            np.square(np.clip(self.sim.data.cfrc_ext, -1, 1)))
        survive_reward = 0.0
        reward = goal_reward - ctrl_cost - contact_cost + survive_reward
        state = self.state_vector()
        done = False
        ob = self._get_obs()
        return ob, reward, done, dict(
            goal_forward=goal_reward,
            reward_ctrl=-ctrl_cost,
            reward_contact=-contact_cost,
            reward_survive=survive_reward,
        )

    def sample_tasks(self, num_tasks):
        a = np.random.random(num_tasks) * 2 * np.pi
        r = 3 * np.random.random(num_tasks) ** 0.5
        goals = np.stack((r * np.cos(a), r * np.sin(a)), axis=-1)
        tasks = [{'goal': goal} for goal in goals]
        return tasks

    def _get_obs(self):
        return np.concatenate([
            self.sim.data.qpos.flat,
            self.sim.data.qvel.flat,
            np.clip(self.sim.data.cfrc_ext, -1, 1).flat,
        ])

    def get_smm_reward(self,state):
        rew = 0
        for i in range(len(self.tasks)):
            x = state[0] - self.tasks[i]['goal'][0]
            y = state[1] - self.tasks[i]['goal'][1]
            dis = (x ** 2 + y ** 2) ** 0.5
            if dis < 0.3:
                rew = rew + 1
        if rew > 0:
            return np.sqrt(rew/len(self.tasks))
        else:
            return -1

class AntGoalEnv_SMM(MultitaskAntEnv):
    def __init__(self, goal_prior=None,sample_goal = None,shaped_rewards=None,distance_threshold=None,init_object_pos_prior=None,terminate_upon_success=None,terminate_upon_failure=None,task={}, n_tasks=100, randomize_tasks=True, reward_radius = 0.3, **kwargs):
        self.reward_radius = reward_radius
        super(AntGoalEnv_SMM, self).__init__(task, n_tasks, **kwargs)


    def step(self, action):
        self.do_simulation(action, self.frame_skip)
        xposafter = np.array(self.get_body_com("torso"))

        goal_reward = -np.sum(np.abs(xposafter[:2] - self._goal)) # make it happy, not suicidal

        ctrl_cost = .1 * np.square(action).sum()
        contact_cost = 0.5 * 1e-3 * np.sum(
            np.square(np.clip(self.sim.data.cfrc_ext, -1, 1)))
        survive_reward = 0.0
        reward = goal_reward - ctrl_cost - contact_cost + survive_reward
        reward = self.get_smm_reward(xposafter[:2])
        state = self.state_vector()
        done = False
        ob = self._get_obs()
        return ob, reward, done, dict(
            goal_forward=goal_reward,
            reward_ctrl=-ctrl_cost,
            reward_contact=-contact_cost,
            reward_survive=survive_reward,
        )

    def sample_tasks(self, num_tasks):
        a = np.random.random(num_tasks) * 1 * np.pi
        r = 3 * np.random.random(num_tasks) ** 0.5
        r = 1
        goals = np.stack((r * np.cos(a), r * np.sin(a)), axis=-1)
        tasks = [{'goal': goal} for goal in goals]
        return tasks

    def _get_obs(self):
        return np.concatenate([
            self.sim.data.qpos.flat,
            self.sim.data.qvel.flat,
            np.clip(self.sim.data.cfrc_ext, -1, 1).flat,
        ])

    def get_smm_reward(self,state):
        rew = 0
        for i in range(len(self.tasks)):
            x = state[0] - self.tasks[i]['goal'][0]
            y = state[1] - self.tasks[i]['goal'][1]
            dis = (x ** 2 + y ** 2) ** 0.5
            if dis < self.reward_radius:
                rew = rew + 1
        if rew > 0:
            return np.sqrt(rew/len(self.tasks))
        else:
            return -1
if __name__=="__main__":
    env = AntGoalEnv_SMM()
    print(env.observation_space,env.action_space,env.tasks)
    print(env.step(np.zeros((8,))))
    import matplotlib.pyplot as plt
    plt.figure()
    for i in range(len(env.tasks)):
        plt.scatter(env.tasks[i]['goal'][0],env.tasks[i]['goal'][1])
        print(env.tasks[i]['goal'][:2])
    plt.show()
