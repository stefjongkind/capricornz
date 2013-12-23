class AlterColumnCategoryDescription < ActiveRecord::Migration
  def self.up
    change_column :categories, :description, :text
  end

  def self.down
    change_column :categories, :description, :string
  end
end
