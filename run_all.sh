#!/bin/bash

echo "Starting preprocessing..."

# Preprocessing
echo "Running COLMAP..."
python preprocess/generate_colmap.py --project_dir ${DATASET_DIR}

echo "Generating chunks..."
python preprocess/generate_chunks.py --project_dir ${DATASET_DIR}

echo "Generating depth..."
python preprocess/generate_depth.py --project_dir ${DATASET_DIR}

echo "Starting optimization..."

# Optimization
python scripts/full_train.py --project_dir ${DATASET_DIR}

echo "Process completed."