class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :account_number
      t.string :last_name
      t.string :maiden_name
      t.string :first_name

      t.timestamps null: false
    end
  end
end
