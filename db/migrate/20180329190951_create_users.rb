class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :phone, null: false
      t.string :first_name, null: true, default: nil, limit: 25
      t.string :middle_name, null: true, default: nil, limit: 25
      t.string :last_name, null: true, default: nil, limit: 25
      t.date :birthday, null: true, default: nil
      t.text :biography, null: true, default: nil, limit: 500
      t.string :image, null: true, default: nil
      t.string :password_digest, null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
