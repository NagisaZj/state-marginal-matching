python -m train configs/smm_point.json

python -m visualize out/ManipulationEnv-uniform-object_off_table,object_goal_indicator,object_gripper_indicator,action_penalty/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_09_27_47_0000--s-0



python -m test_point out/PointEnv-1-0.05/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_13_29_25_0000--s-0


python -m print_point

python ./viskit/frontend.py ./out/PointEnv-1-0.2/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_11_02_44_0000--s-0/  ./viskit/frontend.py ./out/PointEnv-1-0.2/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_10_50_52_0000--s-0/  --port=5002



python ./viskit/frontend.py ./out/PointEnv-1-0.05/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_13_29_25_0000--s-0/ ./viskit/frontend.py ./out/PointEnv-1-0.05/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_13_35_08_0000--s-0/ --port=5003

