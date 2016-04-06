class AddSubjetToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :subject, :string
  end
end
