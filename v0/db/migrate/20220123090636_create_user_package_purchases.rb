class CreateUserPackagePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :user_package_purchases do |t|
      t.integer :user_id, foreign_key: {to_table: :users}, null: false, on_delete: :cascade
      t.integer :package_id, foreign_key: {to_table: :packages}, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
