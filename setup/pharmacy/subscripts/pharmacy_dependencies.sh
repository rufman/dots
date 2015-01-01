#!/usr/bin/env bash

echo ""
echo "#########################################################################"
echo "Installing global dependencies"
pip install PasteScript
pip install mysql-python
pip install pylibmc

cd /tmp
git clone https://github.com/dlitz/pycrypto.git
cd pycrypto
python setup.py build
python setup.py install

# Install al pharmacy dependencies
echo ""
echo "#########################################################################"
echo "Running setup.py"
cd "$project_path/pharmacy"
python setup.py develop || python setup.py develop || { echo 'ERROR: pharmacy setup failed' ; exit 1; }