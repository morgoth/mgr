# pobranie źródeł RubyGems
wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
# rozpakowanie oraz kompilacja
tar -xzf rubygems-1.3.5.tgz
cd rubygems-1.3.5
sudo ruby setup.rb
# aktualizacja do najnowszej wersji
sudo gem update --system
cd ..