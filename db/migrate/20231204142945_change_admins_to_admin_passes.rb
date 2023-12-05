class ChangeAdminsToAdminPasses < ActiveRecord::Migration[6.1]
  def change
    rename_table :admins, :admin_passes
  end
end
