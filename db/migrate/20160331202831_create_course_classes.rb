class CreateCourseClasses < ActiveRecord::Migration
  def change
    create_table :course_classes do |t|
      t.date :date
      t.boolean :active, default: true
      t.references :classday, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
