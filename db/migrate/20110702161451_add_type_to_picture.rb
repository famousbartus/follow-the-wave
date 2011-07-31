class AddTypeToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :picture_type, :string
  end

  def self.down
    remove_column :pictures, :picture_type
  end
end
