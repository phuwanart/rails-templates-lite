gem 'devise', github: 'strobilomyces/devise', branch: 'patch-1'

Bundler.with_unbundled_env { run 'bundle install' }

generate 'devise:install'
