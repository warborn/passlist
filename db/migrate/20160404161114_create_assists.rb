class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.boolean :assist, default: false
      t.references :student, index: true, foreign_key: true
      t.references :course_class, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
