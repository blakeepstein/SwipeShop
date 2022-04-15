class AddUseToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :use, :string
  end
end
