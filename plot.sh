CUDA_VISIBLE_DEVICES=7 python -m train configs/smm_point.json


python -m visualize out/ManipulationEnv-uniform-object_off_table,object_goal_indicator,object_gripper_indicator,action_penalty/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_09_27_47_0000--s-0



python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_25_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_05_25_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_08_20_12_28_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_08_20_20_29_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_33_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_05_37_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_08_20_12_36_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_08_20_20_38_0000--s-0

python -m print_point

python ./viskit/frontend.py ./out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_25_0000--s-0/ ./viskit/frontend.py ./out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_33_0000--s-0/ --port=5002