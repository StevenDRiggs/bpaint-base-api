class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.integer :creator_id, foreign_key: {to_table: :users}, on_delete: :nullify

      t.timestamps
    end
  end
end
