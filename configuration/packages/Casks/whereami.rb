cask :v1 => 'whereami' do
  version :latest
  sha256 '6cc9ecaba9e1e9f5618cd239dc8eb6bac0bd86e06c29297c8fda900f26b2b829'

  url 'https://github.com/robmathers/WhereAmI/releases/download/v1.02/whereami-1.02.zip'
  name 'whereami'
  homepage 'https://github.com/robmathers/WhereAmI'
  license :unknown    # todo: change license and remove this comment; ':unknown' is a machine-generated placeholder

  binary 'whereami'
end
