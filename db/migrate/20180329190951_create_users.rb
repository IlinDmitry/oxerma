class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false # Почта
      t.string :phone, null: false # Телефон
      t.string :first_name, null: true, default: nil, limit: 25 # Имя
      t.string :last_name, null: true, default: nil, limit: 25 # Фамилия
      t.date :birthday, null: true, default: nil # День рождения
      t.text :biography, null: true, default: nil, limit: 500 # Краткая информация
      t.text :itn, null: true, default: nil, limit: 10 # ИНН
      t.text :inoial, null: true, default: nil, limit: 11 # СНИЛС
      t.string :image, null: true, default: nil # Изображение
      t.string :password_digest, null: false # Дайджест пароля
      t.timestamps # Время создания и обновления
    end
    add_index :users, :email, unique: true
  end
end
