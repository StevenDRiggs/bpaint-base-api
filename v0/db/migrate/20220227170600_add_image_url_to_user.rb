class AddImageUrlToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image_url, :string, null: false, default: 'https://picsum.photos/200/300'
  end
end
