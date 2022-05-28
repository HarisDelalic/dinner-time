require 'test_helper'

class IngredientParserTest < ActiveSupport::TestCase
  test "should construct ingredient parsed by pattern with unit of measurement" do
    ingredient_text = "1 ¾ cup all-purpose flour"

    ingredient = IngredientParser.parse_full_match_pattern ingredient_text

    assert_equal  1.75, ingredient.quantity
    assert_equal 'cup', ingredient.unit_of_measurement
    assert_equal 'all-purpose flour', ingredient.name
  end

  test "should construct ingredient parsed by pattern without unit of measurement" do
    ingredient_text = "1 ½ egg"

    ingredient = IngredientParser.parse_piece_pattern ingredient_text

    assert_equal  1.5, ingredient.quantity
    assert_equal 'piece', ingredient.unit_of_measurement
    assert_equal 'egg', ingredient.name
  end
end
