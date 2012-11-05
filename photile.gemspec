Gem::Specification.new do |s|
  s.name                        = 'photile'
  s.version                     = '0.1.0.pre'
  s.date                        = '2012-11-02'
  s.summary                     = 'A ruby gem to chop a photo into tiles, watermark them, etc.'
  s.description                 = 'Photile is just a layer on top of Imagemagick and Jpegtran to make certain image processing tasks dead simple.'
  s.author                      = 'Nitin Dhar'
  s.email                       = 'nitindhar7@yahoo.com'
  s.files                       = `git ls-files`.split("\n")
  s.executables                 = ['photile']
  s.bindir                      = 'bin'
  s.license                     = 'MIT'
  s.homepage                    = 'https://github.com/nitindhar7/photile'
  s.add_development_dependency  'rake', ['>= 0.9.2']
  s.required_ruby_version       = '>= 1.8.7'
  s.requirements                << 'imagemagick' << 'imagemagick-common' << 'libjpeg-turbo-progs'
end
