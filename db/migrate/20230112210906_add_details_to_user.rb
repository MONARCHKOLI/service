class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobileno, :integer
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :pincode, :integer
    add_column :users, :state, :string
  end
end
