# pobranie niezbędnych pakietów
sudo apt-get install build-essential zlib1g-dev \
libreadline5-dev libssl-dev libmagick++-dev \
libsqlite3-dev imagemagick libxslt1-dev libxml2-dev
# pobranie wersji 1.8.7
wget ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p174.tar.gz
# rozpakowanie pliku .tar.gz
tar -xzf ruby-1.8.7-p174.tar.gz
# przejście do katalogu oraz kompilacja
cd ruby-1.8.7-p174
./configure
make
sudo make install
