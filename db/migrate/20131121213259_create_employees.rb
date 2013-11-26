class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :annual_salary,   default: 0
      t.decimal :super_rate,      default: 0, precision: 4, scale: 2

      t.timestamps
    end

    add_index :employees, [:id]
  end
end
