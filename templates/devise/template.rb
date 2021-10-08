source_paths.unshift(__dir__)

gem 'devise', github: 'strobilomyces/devise', branch: 'patch-1'

Bundler.with_unbundled_env { run 'bundle install' }

generate 'devise:install'

say 'Default application.html.erb is missing!', :red
if defined?(Turbo)
  say %(        Add <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %> within the <head> tag in your custom layout.)
else
  say %(        Add <%= stylesheet_link_tag "application" %> within the <head> tag in your custom layout.)
end

copy_file 'Procfile', force: true
