class DestroySessionUser < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
