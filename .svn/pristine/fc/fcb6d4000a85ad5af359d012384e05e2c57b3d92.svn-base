class RenamePhotoImage < ActiveRecord::Migration
  def self.up
    rename_column :photos, :description, :image
  end

  def self.down
    rename_column :photos, :image, :description
  end
end
