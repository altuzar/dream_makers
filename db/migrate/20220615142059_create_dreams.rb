class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.text :description
      t.string :email
      t.string :status, :null => false, :default => "Open"
      t.integer :rating, :limit => 2, :null => false, :default => 0
      t.boolean :published, :null => false, :default => 1

      t.timestamps
    end
  end
end
