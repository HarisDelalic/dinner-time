class IngredientParser
  # Used when unit of measurement is included in ingredient name, for example 1 TEASPOON salt
  WITH_UNIT_OF_MEASUREMENT_PATTERN = /([\d+]?\s?)([\u00BC-\u00BE\u2150-\u215E]?)\s+([a-z]+)\s(.*)?/
  # Used when unit of measurement is not included in ingredient name, for example 1 egg (no teaspoon)
  WITHOUT_UNIT_OF_MEASUREMENT_PATTERN = /([\d+]?\s?)([\u00BC-\u00BE\u2150-\u215E]?)\s+(.*)?/

  VULGAR_TO_FLOAT = {
    "¼" => 1.0 / 4.0,
    "½" => 1.0 / 2.0,
    "¾" => 3.0 / 4.0,
    "⅐" => 1.0 / 7.0,
    "⅑" => 1.0 / 9.0,
    "⅒" => 1.0 / 10.0,
    "⅓" => 1.0 / 3.0,
    "⅔" => 2.0 / 3.0,
    "⅕" => 1.0 / 5.0,
    "⅖" => 2.0 / 5.0,
    "⅗" => 3.0 / 5.0,
    "⅘" => 4.0 / 5.0,
    "⅙" => 1.0 / 6.0,
    "⅚" => 5.0 / 6.0,
    "⅛" => 1.0 / 8.0,
    "⅜" => 3.0 / 8.0,
    "⅝" => 5.0 / 8.0,
    "⅞" => 7.0 / 8.0,
    "↉" => 0.0
  }.freeze

  def self.parse (ingredient)
    if ingredient.match(WITH_UNIT_OF_MEASUREMENT_PATTERN)
      self.parse_full_match_pattern ingredient
    elsif ingredient.match(WITHOUT_UNIT_OF_MEASUREMENT_PATTERN)
      self.parse_piece_pattern ingredient
    end
  end

  def self.parse_full_match_pattern(ingredient)
    m = ingredient.match(WITH_UNIT_OF_MEASUREMENT_PATTERN)
    quantity = get_quantity(m[1], m[2])
    unit_of_measurement = get_unit_of_measurement(m[3])
    name = m[4]

    Ingredient.new(name: name, quantity: quantity, unit_of_measurement: unit_of_measurement)
  end

  def self.parse_piece_pattern(ingredient)
    m = ingredient.match(WITHOUT_UNIT_OF_MEASUREMENT_PATTERN)
    quantity = get_quantity(m[1], m[2])
    name = m[3]

    Ingredient.new(name: name, quantity: quantity, unit_of_measurement: 'piece')
  end

  private

  def self.get_unit_of_measurement(unit_of_measurement)
    if unit_of_measurement == 'cup' || unit_of_measurement == 'cups'
      return 'cup'
    elsif unit_of_measurement == 'tablespoon' || unit_of_measurement == 'tablespoons'
      return 'tablespoon'
    elsif unit_of_measurement == 'teaspoon' || unit_of_measurement == 'teaspoons'
      return 'teaspoon'
    else
      return 'piece'
    end
  end

  def self.get_quantity(int_part, float_part)
    int_part.to_i + VULGAR_TO_FLOAT[float_part].to_f
  end
end