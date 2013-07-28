# Centos 6.4 64bit


# Install required dependencies 
sudo yum install gcc glibc-devel make ncurses-devel openssl-devel autoconf make git

# Install erlang
wget http://erlang.org/download/otp_src_R15B01.tar.gz
tar zxvf otp_src_R15B01.tar.gz
cd otp_src_R15B01
./configure && make && sudo make install




# Install erlang
wget http://www.erlang.org/download/otp_src_R16B01.tar.gz
tar zxvf otp_src_R16B01.tar.gz
cd otp_src_R16B01
./configure && make && sudo make install
