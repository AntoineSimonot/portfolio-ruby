class AddSignAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :current_sign_in_at, :date
  end
end
