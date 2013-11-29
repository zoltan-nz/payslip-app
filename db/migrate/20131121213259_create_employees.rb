class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :annual_salary
      t.decimal :super_rate,      precision: 4, scale: 2

      t.timestamps
    end

    add_index :employees, [:id]
  end
end
