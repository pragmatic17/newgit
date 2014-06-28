class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column :url, :string
      t.column :description, :string
      t.column :created_at, :datetime
      t.column :points, :integer, :default =>0
      t.timestamps
    end
  end

  def self.down
  	drop_table :links
  end
end
