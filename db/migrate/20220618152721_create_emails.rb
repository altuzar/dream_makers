class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.boolean :consent

      t.timestamps
    end
  end
end
