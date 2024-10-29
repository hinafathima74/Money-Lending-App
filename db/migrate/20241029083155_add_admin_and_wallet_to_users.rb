class AddAdminAndWalletToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :wallet, :decimal, precision: 15, scale: 2, default: 10000
  end
end
