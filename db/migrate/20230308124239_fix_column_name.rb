class FixColumnName < ActiveRecord::Migration[7.0]
  def change
     rename_column :contacts, :Name, :name
     rename_column :contacts, :PhoneNumber, :phone
  end
end
