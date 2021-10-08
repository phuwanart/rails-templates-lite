source_paths.unshift(__dir__)

def rails_version
  @rails_version ||= Gem::Version.new(Rails::VERSION::STRING)
end

def rails_7?
  Gem::Requirement.new('>= 7.0.0.alpha', '< 8.0.0.alpha').satisfied_by? rails_version
end

if rails_7?
  gem 'devise', github: 'strobilomyces/devise', branch: 'patch-1'
else
  gem 'devise'
end

Bundler.with_unbundled_env { run 'bundle install' }

generate 'devise:install'

say 'Default application.html.erb is missing!', :red
if defined?(Turbo)
  say %(        Add <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %> within the <head> tag in your custom layout.)
else
  say %(        Add <%= stylesheet_link_tag "application" %> within the <head> tag in your custom layout.)
end
