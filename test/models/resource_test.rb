require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  context "validations" do
    should validate_presence_of(:name)
    should define_enum_for(:unit_of_measurement).
      with_values(cup: "cup", piece: "piece", teaspoon: "teaspoon", tablespoon: "tablespoon")
                                                .backed_by_column_of_type(:enum)
  end
end
