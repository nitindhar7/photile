require 'test/unit'
require 'photile'

class PhotileTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "hello world", Photile.hi("english")
  end

end
