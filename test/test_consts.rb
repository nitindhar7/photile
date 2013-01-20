require 'test/unit'
require 'photile'

class ConstsTest < Test::Unit::TestCase

  def test_version
    assert !Regexp.new(/\d+\.\d+\.\d+/).match(Photile::VERSION).nil?
  end

  def test_requirements
    assert_equal "photile requires the following libraries " +
                 "to be installed: imagemagick, imagemagick-common " +
                 "and libjpeg-turbo-progs",
                 Photile::REQUIREMENTS
  end

end