class RenameUsersOrganizationsToEmploye < ActiveRecord::Migration[5.2]
  def change
    rename_table :users_organizations, :employees
  end
end
