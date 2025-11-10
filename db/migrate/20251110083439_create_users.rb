class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.bigint :github_id, null: false
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
    add_index :users, :github_id, unique: true
  end
end
