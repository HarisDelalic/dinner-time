class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit_of_measurement
      t.decimal :quantity
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
