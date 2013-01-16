require 'test/unit'
require 'photile'

class RequirementsTest < Test::Unit::TestCase
  def test_requirements
    assert_not_nil `which convert`
    assert_not_nil `which composite`
    assert_not_nil `which jpegtran`
  end
end
