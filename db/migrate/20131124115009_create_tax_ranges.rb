class CreateTaxRanges < ActiveRecord::Migration
  def change
    create_table :tax_ranges do |t|
      t.integer :income_min
      t.integer :income_max
      t.decimal :rate
      t.integer :tax_from_lower_range

      t.timestamps
    end

    add_index :tax_ranges, [:income_min, :income_max]
  end
end
