source "http://gemcutter.org"
source "http://gems.github.com"

gem "mysql"
gem "will_paginate", "2.3.12"
gem "nokogiri", "1.4.2"
gem "haml", "2.2.20"
gem "sendgrid"
gem 'breadcrumbs_on_rails'
gem "json"
gem "actionmailer", "2.3.8"
gem "paperclip", "~> 2.3"
gem "jrails"
gem 'devise', '1.1.3'
gem "oa-oauth", :require => "omniauth/oauth"

# Trick z group :bundle służy temu by gem nie był ładowany automatycznie
# przez bundlera w żadnym ze środowisk. Dopiero jawny require załaduje gem.
# Przydatne w taskach, skryptach gdy reszta aplikacji nie potrzebuje danego
# gema (niepotrzebny narzut na ładowanie i pamięć).
group :bundle do
  gem "rails", "2.3.8"
end

group :development do
  gem "mongrel"
end

group :test do
end
