class AddSlugToPackage < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :slug, :string, null: false, default: ''
  end
end
