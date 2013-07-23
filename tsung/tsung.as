# Centos 6.4 64bit


# Install required dependencies 
sudo yum -y install erlang perl perl-RRD-Simple.noarch perl-Log-Log4perl-RRDs.noarch gnuplot perl-Template-Toolkit firefox


# Install tsung
wget http://tsung.erlang-projects.org/dist/tsung-1.4.2.tar.gz
tar zxfv  tsung-1.4.2.tar.gz
cd tsung-1.4.2
./configure && make && make install



