require 'optparse'

class Photile::Cli
  def self.parse
    options = []

    optparse = OptionParser.new do|opts|
      opts.banner = "Usage: photile [options] infile outfile"

      opts.on('-q', '--quality VALUE', Integer, 'Modify image quality') do |value|
        validate_percent_value('Quality', value)
        options << {:quality => value}
      end

      opts.on('-c', '--compress', 'Loss-less compress image') do
        options << {:compress => true}
      end

      opts.on('-w', '--watermark FILE', String, 'Watermark with given file') do |file|
        validate_file_exist file
        options << {:watermark => file}
      end

      opts.on('-t', '--tile WIDTHxHEIGHT', Regexp.new(/\d+x\d+/), 'Tile to the given dimensions') do |dimensions|
        dim = dimensions.split('x')
        validate_2d_dimensions dim
        options << {:tile => {:width => dim.first.to_i, :height => dim.last.to_i}}
      end

      opts.on('-v', '--verbose', 'Run verbosely') do |value|
        options << {:verbose => value}
      end

      opts.on('-h', '--help', 'Display options help') do
        puts opts
        puts Photile::REQUIREMENTS
        exit
      end
    end

    begin
      optparse.parse!

      if options.empty? || ARGV.size != 2
        puts optparse
        puts Photile::REQUIREMENTS
        exit
      end

      validate_file_exist ARGV.first

      {:options => options, :infile => ARGV.first, :outfile => ARGV.last}
    rescue OptionParser::InvalidArgument
      puts 'Invalid argument'
      puts optparse
      exit
    rescue OptionParser::InvalidOption
      puts 'Invalid option'
      puts optparse
      exit
    rescue Exception => e
      puts e
      puts optparse
      exit
    end
  end

  def self.validate_percent_value(metric, value)
    raise "Invalid percentage: #{metric} #{value}%. Acceptable range: 0-100" if value < 0 || value > 100
  end

  def self.validate_2d_dimensions(dims)
    raise "Invalid dimensions: #{dims.first}x#{dims.last}. Acceptable dimensions are > 0" if dims.first <= 0 || dims.last <= 0
  end

  def self.validate_file_exist(file)
    raise "File [#{file}] not found" if !FileTest.exists? file
  end
end