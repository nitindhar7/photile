require 'optparse'

class Photile::Cli
  def self.parse
    options = []

    optparse = OptionParser.new do|opts|
      opts.banner = "Usage: photile [options] infile outfile"

      opts.on('-q', '--quality VALUE', Integer, 'Modify image quality') do |value|
        options << {:quality => value}
      end

      opts.on('-c', '--compress', 'Loss-less compress image') do
        options << {:compress => true}
      end

      opts.on('-w', '--watermark FILE', String, 'Watermark with given file') do |file|
        options << {:watermark => file}
      end

      opts.on('-t', '--tile WIDTHxHEIGHT', Regexp.new(/\d+x\d+/), 'Tile to the given dimensions') do |dimensions|
        dim = dimensions.split('x')
        options << {:tile => {:width => dim.first.to_i, :height => dim.last.to_i}}
      end

      opts.on('-v', '--[no-]verbose', 'Run verbosely') do |value|
        options << {:verbose => value}
      end

      opts.on('-h', '--help', 'Display options help') do
        puts opts
        puts 'photile requires the following libraries to be installed: imagemagick, imagemagick-common and libjpeg-turbo-progs'
        exit
      end
    end

    begin
      optparse.parse!

      if options.empty? || ARGV.size != 2
        puts optparse
        puts 'photile requires the following libraries to be installed: imagemagick, imagemagick-common and libjpeg-turbo-progs'
        exit
      end

      {:options => options, :infile => ARGV.first, :outfile => ARGV.last}
    rescue OptionParser::InvalidArgument => ia
      puts 'Invalid argument'
      puts optparse
      exit
    rescue OptionParser::InvalidOption => io
      puts 'Invalid option'
      puts optparse
      exit
    end
  end
end