# dodanie serwera GitHub do dostępnych źródeł
sudo gem sources -a http://gems.github.com
cp config/example_database.yml config/database.yml
# instalacja Ruby on Rails
sudo gem install rails
# instalacja gema dla bazy danych SQLite3
sudo gem install sqlite3-ruby prawn
# instalacja używanych gemów
sudo rake gems:install RAILS_ENV=test
# ładowanie schematu bazy danych
rake db:schema:load
# uruchomienie testów jednostkowych
rake test:units
# uruchomienie testów integracyjnych
rake cucumber