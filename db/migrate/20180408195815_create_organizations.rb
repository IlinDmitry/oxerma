class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.integer :psrn, null: false, limit: 5 # ОГРН
      t.string :name, null: false, limit: 25 # Название
      t.integer :category, null: true, default: 0 # Тип
      t.string :email, null: false # Почта
      t.string :phone, null: false # Телефон
      t.text :biography, null: true, default: nil, limit: 500 # Краткая информация
      t.string :image, null: true, default: nil # Изображение
      t.timestamps # Время создания и обновления
    end
    add_index :organizations, :psrn, unique: true
    create_table(:users_organizations, id: false) do |t|
      t.references :user
      t.references :organization
    end
    add_index :users_organizations, [:user_id, :organization_id]
  end
end
