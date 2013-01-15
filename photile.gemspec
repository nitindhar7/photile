Gem::Specification.new do |s|
  s.name                        = 'photile'
  s.version                     = `git describe`
  s.date                        = Time.now.strftime("%Y-%m-%d")
  s.summary                     = 'A ruby gem to compress a photo, chop it into tiles, watermark it, etc.'
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
