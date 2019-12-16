all: prepdata train

.PHONY: prepdata
prepdata:
	python kitti/prepare_data.py --car_only --gen_train --gen_val --gen_val_rgb_detection --prefix gan_pl

.PHONY: train

train:
	python train/train_net_det.py --cfg cfgs/det_sample.yaml OUTPUT_DIR output/car_train

.PHONY: eval

eval:
	python train/test_net_det.py --cfg cfgs/det_sample.yaml OUTPUT_DIR output/car_train TEST.WEIGHTS output/car_train/model_0050.pth
