class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      # t.column :name, :string
      t.column :name, :string
      t.column :photo_path, :string
    end
  end

  def self.down
    drop_table :categories
  end
end
