class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.integer :psrn, null: false, limit: 5
      t.string :name, null: false, limit: 25
      t.integer :type_id, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :biography, null: true, default: nil, limit: 500
      t.string :image, null: true, default: nil
      t.timestamps
    end
    add_index :organizations, :psrn, unique: true
    create_table(:users_organizations, id: false) do |t|
      t.references :user
      t.references :organization
    end
    add_index :users_organizations, [:user_id, :organization_id]
  end
end
