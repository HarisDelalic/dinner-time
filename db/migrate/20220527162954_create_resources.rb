class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :name, null: false, index: { unique: true }
      t.decimal :quantity, precision: 5, scale: 2

      t.timestamps
    end
  end
end
