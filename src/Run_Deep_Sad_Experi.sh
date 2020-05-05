#!/bin/sh

#  Run_Deep_Sad_Experi.sh
#  
#
#  Created by Matt De Vries on 05/05/2020.
#

for normal_class in 0 2 3 4 5 6 7 8 9
do
    for unknown_class in {0..9}
    do
        if [ $normal_class -eq $unknown_class ]; then
              continue
        fi
        for gamma_p in 0. 0.01 0.05 0.1 0.2
        do

            python main.py fminist fmnist_LeNet ../log/deepSAD/fminist/scenario_2 ../data --ratio_known_outlier 0.05 --ratio_pollution $gamma_p \
            --lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
            --ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class $normal_class --known_outlier_class $unknown_class \
            --n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6;

        done
    done
done
