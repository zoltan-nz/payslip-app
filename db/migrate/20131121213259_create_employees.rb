class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :annual_salary, default: 0
      t.decimal :super_rate, default: 0
      t.string :payment_start_date

      t.timestamps
    end
  end
end
