module Util
  def normalize file
    remove_parents(remove_template_extension file)
  end

  def remove_parents file
    file.sub(/^dotfiles\/.*?\//, '')
  end

  def remove_template_extension file
    file.sub(/\.erb$/, '')
  end

  def tree dir
    Dir.glob("#{dir}/**/*", File::FNM_DOTMATCH).select { |f| File.file? f }
  end
end
