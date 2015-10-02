#!/usr/bin/env bash

# paths
dbscript_path="/Volumes/untitled 1/"
dbscript_name="database.sql"

# Check if pharmacy exists
if [ ! -d "$project_path/pharmacy" ]; then
  # make and clone
  mkdir "$project_path/pharmacy"
  cd "$project_path/pharmacy"
  git clone git@github.com:bezdekt/pharmacy.git
  cd "$project_path/pharmacy"
  echo "test" > ENVIRONMENT.txt
fi

# Create pharmacy virtualenv and the set it up
source `which virtualenvwrapper.sh`
mkvirtualenv pharmacy

# Install all dependencies in the pharmacy virtualenv
sh "$project_path/pharmacy/subscripts/pharmacy_dependencies.sh"

# Create MySQL user(pharmacy/pr0p3rfl0w) and grant permission to pharmacydb
echo ""
echo ""
echo "Setting up database"
echo "#########################################################################"
mysql.server start
mysql --user="root" --execute="CREATE DATABASE pharmacydb;"
mysql --user="root" --execute="CREATE USER pharmacy IDENTIFIED BY 'pH4rmA';"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON pharmacydb.* TO pharmacy@localhost IDENTIFIED BY 'pH4rmA';"
mysql --user="root" --execute="CREATE DATABASE pharma_test;"
mysql --user="root" --execute="CREATE USER pharma_test IDENTIFIED BY 'pharma_test';"
mysql --user="root" --execute="GRANT ALL PRIVILEGES ON pharma_test.* TO pharma_test@localhost IDENTIFIED BY 'pharma_test';"

echo ""
echo "#########################################################################"
echo "Import data from specified location"
cp "$dbscript_path/$dbscript_name.gz" /tmp/. || { echo "ERROR: Couldnt copy $dbscript_path/$dbscript_name.gz" ; exit 1; }
gunzip "/tmp/$dbscript_name.gz" || { echo "ERROR: unzipping $dbscript_name.gz failed" ; exit 1; }
mysql --user="root" "pharmacydb" < "/tmp/$dbscript_name" || { echo "ERROR: Import of $dbscript_name failed" ; exit 1; }

# Run unit tests
echo ""
echo "#########################################################################"
echo "Testing installation"
python setup.py test -q

echo ""
echo "#########################################################################"
echo "Create m.gr.com link in hosts file"
echo "127.0.0.1  m.gr.com m.gbs.gr.com m.ihop.gr.com" > /tmp/newfile
echo "127.0.0.1  www.gr.com gbs.gr.com ihop.gr.com" >> /tmp/newfile
echo "127.0.0.1  assets.gr.com" >> /tmp/newfile
sudo cat /etc/hosts >> /tmp/newfile
sudo cp /tmp/newfile /etc/hosts
