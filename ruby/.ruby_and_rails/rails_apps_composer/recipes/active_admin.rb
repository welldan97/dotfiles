gem 'activeadmin'

after_bundler do
  say_wizard "recipe running after 'bundle install'"
  if prefer :admin, 'active_admin'
    generate 'active_admin:install'
    generate 'active_admin:resource User' if prefer :authentication, 'devise'
    
    ### GIT
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer(welldan97): active_admin"' if prefer :git, true
  end
end # after_bundler

__END__

name: active_admin
description: "Configure Active Admin"
author: welldan97

requires: [gems]
run_after: [gems]
category: mvc
