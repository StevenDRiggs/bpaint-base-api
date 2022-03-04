class AddNameToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :name, :string, null: false

    add_index :packages, :name, unique: true
  end
end
