# Site
В проекте используется субд Postgresql. Скачать можно тут: https://www.postgresql.org/download/
Версия ruby 2.5.1

Настройка окружения:
```
gem install bundler -v 2.3.26
bundle install
rails db:create db:migrate db:seed
```
Настройка и запуск тестов:
Нужно выполнить команду 
```
rails test:db
```
при выполнении может появится ошибка 
```
undefined method `external_at_exit=' for SimpleCov:Module (NoMethodError)
```
её нужно игнорировать.
Команда для запуска тестов:
```
rspec
```