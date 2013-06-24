after_everything do
  say_wizard "recipe running after everything"
  if prefer :gemfile_template, true
    remove_file 'Gemfile'
    remove_file 'Gemfile.lock'

    # set source paths for thor
    @source_paths << '/Users/welldan97/.ruby_and_rails/templates'
    template 'Gemfile.tt'
    
    run 'bundle install'

    ### GIT
    git :add => '-A' if prefer :git, true
    git :commit => '-qm "rails_apps_composer(welldan97): magick files"' if prefer :git, true
  end
end # after_everything

__END__

name: magick_files
description: "Copy magick files"
author: welldan97
run_after: [extras]
category: other
