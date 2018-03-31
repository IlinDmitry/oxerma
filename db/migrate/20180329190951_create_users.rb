class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,
               limit: User::LENGTH_MAXIMUM_EMAIL,
               null: false
      t.string :password_digest,
               null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
