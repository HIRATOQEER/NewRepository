class AddUserIdToContacts < ActiveRecord::Migration[7.0]
  def change
   add_column :contacts, :user2_id, :integer
    add_index :contacts, :user2_id
  end 
end
