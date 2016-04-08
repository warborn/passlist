class AddCourseDatesToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :begin_date, :date
    add_column :groups, :end_date,   :date
  end
end
