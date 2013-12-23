class AddDescriptionToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :description, :string
  end

  def self.down
    add_column :photos, :description
  end
end
