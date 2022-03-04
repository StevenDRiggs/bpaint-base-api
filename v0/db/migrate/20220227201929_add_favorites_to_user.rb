class AddFavoritesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :favorites, :json, default: []
  end
end