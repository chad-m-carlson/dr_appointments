class RenameTypeColumnInAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :type, :string
    add_column :appointments, :visit_type, :string
  end
end
