sudo apt-get update
sudo apt-get upgrade
sudo apt install python3.12-venv
git clone https://github.com/bucky2001/Turnstile-solver
cd turnstile-solver
python3 -m venv myenv
source myenv/bin/activate
pip3 install -r requirements.txt
python -m patchright install msedge
nohup python3 api_solver.py