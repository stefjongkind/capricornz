class DropTableSheets < ActiveRecord::Migration
  def self.up
    drop_table :sheets
    rename_column :photos, :sheet_id, :category_id
  end

  def self.down
    create_table :sheets do |t|
      # t.column :name, :string
      t.column :category_id, :integer
      t.column :sequence_no, :integer
      t.column :name, :string
    end  
  end
end
