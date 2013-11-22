class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :annual_salary
      t.decimal :super_rate
      t.string :payment_start_date

      t.timestamps
    end
  end
end
