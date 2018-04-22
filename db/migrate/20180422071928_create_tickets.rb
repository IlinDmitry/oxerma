class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :biography, null: true, default: nil, limit: 500
      t.string :image, null: true, default: nil
      t.float :price, null: false
      t.integer :signature_price, null: false, default: 0
      t.integer :qty, null: false, default: 1
      t.integer :signature_qty, null: false, default: 0
      t.references :ticketable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
