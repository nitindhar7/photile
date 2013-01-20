require 'test/unit'
require 'photile'
require 'uuid'

class CliTest < Test::Unit::TestCase

  def test_validate_percent_value
    # percentage too high
    exception = assert_raise RuntimeError do
      Photile::Cli.validate_percent_value('metricX', 800)
    end
    assert_equal 'Invalid percentage: metricX 800%. Acceptable range: 0-100', exception.message

    # percentage too low
    exception = assert_raise RuntimeError do
      Photile::Cli.validate_percent_value('metricX', -100)
    end
    assert_equal 'Invalid percentage: metricX -100%. Acceptable range: 0-100', exception.message

    # percentage within acceptable range
    Photile::Cli.validate_percent_value('metricX', 50)
  end

  def test_validate_2d_dimensions
    # valid dimensions
    Photile::Cli.validate_2d_dimensions([1,1])
    Photile::Cli.validate_2d_dimensions([100,100])
    assert true

    # dimensions are negative
    exception = assert_raise RuntimeError do
      Photile::Cli.validate_2d_dimensions([-1,-1])
    end
    assert_equal 'Invalid dimensions: -1x-1. Acceptable dimensions are > 0', exception.message

    # dimensions are 0
    exception = assert_raise RuntimeError do
      Photile::Cli.validate_2d_dimensions([0,0])
    end
    assert_equal 'Invalid dimensions: 0x0. Acceptable dimensions are > 0', exception.message
  end

  def test_validate_file_exist
    # non existent files
    exception = assert_raise RuntimeError do
      Photile::Cli.validate_file_exist("photile-#{UUID.new.generate}.tmp")
    end

    # create a new file, validate it and clean it
    filename = "photile-#{UUID.new.generate}.tmp"
    File.new(filename, "w")
    Photile::Cli.validate_file_exist(filename)
    File.delete(filename)
    assert true
  end

  def test_cli_tile_regexp
    # valid regexp's
    assert !Regexp.new(/\d+x\d+/).match("1x1").nil?
    assert !Regexp.new(/\d+x\d+/).match("100x100").nil?

    # invalid regexp structure
    assert Regexp.new(/\d+x\d+/).match("1y1").nil?
  end

end