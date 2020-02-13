class AddTrainerNameAppointmentsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :trainer_name, :string
    add_column :appointments, :client_name, :string
  end
end
