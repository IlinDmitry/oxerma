class CreateOrganizationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_types do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :organization_types, :name, unique: true
  end
end
