CUDA_VISIBLE_DEVICES=2 python -m train configs/smm_point.json

CUDA_VISIBLE_DEVICES=7 python -m train configs/smm_point_evolve.json

CUDA_VISIBLE_DEVICES=4 python -m train configs/mujoco_ant_goal.json

python -m visualize out/ManipulationEnv-uniform-object_off_table,object_goal_indicator,object_gripper_indicator,action_penalty/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_09_27_47_0000--s-0



python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_25_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_05_25_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_08_20_12_28_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_08_20_20_29_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_33_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_05_37_0000--s-0

python -m test_point out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_08_20_12_36_0000--s-0

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-2-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_23_32_0000--s-0
#bad bad

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-2-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_23_35_0000--s-0
#good

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_04_06_0000--s-0
#soso

python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_03_50_0000--s-0
#soso

python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_10_18_52_07_0000--s-0
#good okay


python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-3-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_43_20_0000--s-0
#bad

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-3-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_43_28_0000--s-0
#bad bad

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-4-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_45_13_0000--s-0
#bad bad

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-4-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_11_09_45_16_0000--s-0]
#soso

python -m test_point out/PointEnv_evolve-1-0.2/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_10_18_52_07_0000--s-0
#good

python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_12_18_46_51_0000--s-0


###point
python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_12_18_46_51_0000--s-0
#rough goals
python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_18_09_04_03_0000--s-0


python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_14_20_32_58_0000--s-0 #4 clusters, good
python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_14_20_34_00_0000--s-0 #4 clusters, good good
python -m test_point out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_15_11_04_19_0000--s-0 #4 clusters
python -m test_ant /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_06_20_0000--s-0  #ant
python -m test_ant /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_06_24_0000--s-0  #ant
python -m test_ant /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_11_00_0000--s-0 #ant
python -m test_ant /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_11_04_0000--s-0  #ant
python -m print_point_cluster
python -m print_ant
python -m print_ant


python ./viskit/frontend.py /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_06_20_0000--s-0  /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_06_24_0000--s-0  /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_11_00_0000--s-0  /home/zj/Desktop/sample/smm/out/ant_goal-0.5/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_21_09_11_04_0000--s-0  --port=5003

python ./viskit/frontend.py ./out/PointEnv-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_25_0000--s-0/ ./viskit/frontend.py ./out/PointEnv-1-0.1/sac-smm-4-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_08_20_03_33_0000--s-0/ ./out/PointEnv_evolve-1-0.1/sac-smm-4-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_10_14_51_42_0000--s-0 --port=5002



python ./viskit/frontend.py ./out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec5.0-lec1.0-lcec1.0_2019_07_13_09_00_02_0000--s-0 ./out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec1.0-lec1.0-lcec1.0_2019_07_14_20_32_58_0000--s-0 ./out/PointEnv_evolve-1-0.1/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_14_20_34_00_0000--s-0--port=5002

python ./viskit/frontend.py ./out/ant_goal-0.1/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_14_20_22_11_0000--s-0 /home/zj/Desktop/sample/smm/out/ant_goal-0.3/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_14_20_21_33_0000--s-0  /home/zj/Desktop/sample/smm/out/ant_goal-1/sac-smm-1-rl1.0-sec10.0-lec1.0-lcec1.0_2019_07_14_20_21_58_0000--s-0  /home/zj/Desktop/sample/smm/out/ant_goal-0.3/sac-smm-1-rl1.0-sec2.0-lec1.0-lcec1.0_2019_07_14_20_38_42_0000--s-0 --port=5003

