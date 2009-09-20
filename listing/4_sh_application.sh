# dodanie serwera GitHub do dostępnych źródeł
sudo gem sources -a http://gems.github.com
cp config/example_database.yml config/database.yml
# instalacja Ruby on Rails
sudo gem install rails
# instalacja gema dla bazy danych SQLite3
sudo gem install sqlite3-ruby
# instalacja używanych gemów
sudo rake gems:install RAILS_ENV=test
# migracja bazy danych
rake db:migrate
# uruchomienie testów jednostkowych
rake test
# uruchomienie testów integracyjnych
cucumber