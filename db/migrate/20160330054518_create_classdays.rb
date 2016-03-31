class CreateClassdays < ActiveRecord::Migration
  def change
    create_table :classdays do |t|
      t.string :day
      t.time :begin_time
      t.time :end_time
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
