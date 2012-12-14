after_bundler do
  say_wizard "recipe running after 'bundle install'"
  if prefer(:email, 'mailcatcher') || prefer(:email_development, 'mailcatcher')
    gsub_file 'config/environments/development.rb', /.*# change to true to allow email to be sent during development\n/, ''
    gsub_file 'config/environments/development.rb', /config.action_mailer.perform_deliveries = false/ do
<<-RUBY
config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
RUBY
    end
  ### GIT
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer(welldan97): mailcatcher"' if prefer :git, true
  end
end # after_bundler

__END__

name: mailcatcher
description: "Configure development email account"
author: welldan97

requires: [email]
run_after: [email]
category: configuration
