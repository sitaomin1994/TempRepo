#!/bin/bash
# environment scripts
# mkdir -p ~/miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# rm ~/miniconda3/miniconda.sh
# ~/miniconda3/bin/conda init bash
# source ~/.bashrc
# conda info --env
# which conda
mkdir -p ~/anaconda3
wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh -O ~/anaconda3/anaconda.sh
bash ~/anaconda3/anaconda.sh -b -u -p ~/anaconda3
rm ~/anaconda3/anaconda.sh
~/anaconda3/bin/conda init bash
source ~/.bashrc

conda config --set channel_priority strict
#conda tos accept --override-channels --channel defaults
#conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
#conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda install -n base conda-libmamba-solver
conda config --set solver libmamba
conda config --add channels conda-forge
conda config --set channel_priority strict

conda create -n py310 python=3.10 -y
conda activate py310

pip install ipykernel
python -m ipykernel install --user --name=py310 --display-name "python(py310)"
jupyter kernelspec list

conda install pytorch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 pytorch-cuda=11.8 -c pytorch -c nvidia
conda install lightning -c conda-forge
conda install conda-forge::tensorflow-gpu
conda install conda-forge::ctgan
conda install -c conda-forge statsmodels seaborn scikit_learn wandb isolearn biopython pyyaml rdt easydict
conda install conda-forge::scikit-learn
pip install bio auto_mix_prep
python -m pip install "flwr[simulation]"
