# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

REPO = 'https://github.com/decidim/decidim.git'
BRANCH = 'staging-lot2'
DECIDIM_VERSION = { git: REPO, branch: BRANCH }

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION

gem "decidim-internal_evaluation", git: "https://github.com/AjuntamentdeBarcelona/decidim-internal-evaluation-module.git", branch: "main"

# Performance
gem "appsignal"

gem "bootsnap", "~> 1.3"

gem "puma", ">= 6.3.1"
gem "faker"

gem "wicked_pdf", "~> 2.1"

gem "seven-zip", git: "https://github.com/fontist/seven_zip_ruby.git", branch: "master"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "brakeman", "~> 5.4"
  gem "decidim-dev", DECIDIM_VERSION
  gem "net-imap", "~> 0.2.3"
  gem "net-pop", "~> 0.1.1"
  gem "net-smtp", "~> 0.3.1"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :production do
  gem 'sidekiq'
end
