class AddUnitOfMeasurementToResources < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE unit_of_measurement_type AS ENUM ('cup', 'piece', 'teaspoon', 'tablespoon');
    SQL
    add_column :resources, :unit_of_measurement, :unit_of_measurement_type
  end
  def down
    remove_column :resources, :unit_of_measurement
    execute <<-SQL
      DROP TYPE unit_of_measurement_type;
    SQL
  end
end
