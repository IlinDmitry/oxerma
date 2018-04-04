class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :email,           null: false
      t.string      :phone,           null: true, default: nil, limit: 15
      t.string      :first_name,      null: true, default: nil, limit: 25
      t.string      :middle_name,     null: true, default: nil, limit: 25
      t.string      :last_name,       null: true, default: nil, limit: 25
      t.text        :biography,       null: true, default: nil, limit: 500
      t.integer     :country_id,      null: true, default: nil
      t.integer     :city_id,         null: true, default: nil
      t.string      :password_digest, null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
