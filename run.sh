#!/bin/bash


python3 ProteinMPNN/protein_mpnn_run.py \
        --pdb_path "relaxed_model_1_pred_0.pdb" \
        --pdb_path_chains  "A" \
        --out_folder "/tmp/output" \
        --num_seq_per_target 100 \
        --sampling_temp "0.1" \
