class AddCreationsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :creations, :json, default: []
  end
end
