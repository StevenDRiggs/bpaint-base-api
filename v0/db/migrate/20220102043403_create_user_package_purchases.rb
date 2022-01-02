class CreateUserPackagePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :user_package_purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
