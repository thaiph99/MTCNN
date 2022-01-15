#!/bin/bash
set -e

echo "Preparing P-Net training data: bbox"
python prepare_data/gen_hard_bbox_pnet.py
### generate training data(Face Landmark Detection Part) for PNet
echo "Preparing P-Net training data: landmark"
python prepare_data/gen_landmark_aug.py --stage=pnet
### generate tfrecord file for tf training
echo "Preparing P-Net tfrecord file"
python prepare_data/gen_tfrecords.py --stage=pnet