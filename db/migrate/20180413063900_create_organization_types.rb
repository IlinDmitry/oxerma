class CreateOrganizationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_types do |t|
      t.string :name, presence: true
      t.timestamps
    end
  end
end
