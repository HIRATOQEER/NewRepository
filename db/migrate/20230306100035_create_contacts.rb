class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :name
      t.string :email
      t.integer :user2_id
      t.timestamps
    end
  end
end
