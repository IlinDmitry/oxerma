class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
    create_table(:users_organizations, id: false) do |t|
      t.references :user
      t.references :organization
    end
    add_index(:users_organizations, [ :user_id, :organization_id ])
  end
end
