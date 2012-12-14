after_bundler do
  if prefer :welldan97_assets, true
    inject_into_file 'config/application.rb', :after => "g.helper_specs false\n" do
<<-RUBY

      g.stylesheets false
      g.javascripts false
RUBY
    end
    inject_into_file 'config/application.rb', '    config.sass.preferred_syntax = :sass', :after => "config.assets.enabled = true\n"

    ### GIT
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer(welldan97): better assets"' if prefer :git, true
  end
end

__END__

name: preferences
description: "Apply my favorites"
author: welldan97
requires: [testing]
run_after: [testing]
category: other
