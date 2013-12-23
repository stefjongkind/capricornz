class AddSequenceNoToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :sequence_no, :integer
  end

  def self.down
    remove_column :photos, :sequence_no
  end
end
