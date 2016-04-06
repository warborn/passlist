class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :groups_students, :groups, on_delete: :cascade
    add_foreign_key :groups_students, :students, on_delete: :cascade
    add_foreign_key :assists, :students, on_delete: :cascade
    add_foreign_key :assists, :course_classes, on_delete: :cascade
    add_foreign_key :course_classes, :classdays, on_delete: :cascade
    add_foreign_key :classdays, :groups, on_delete: :cascade
  end
end
