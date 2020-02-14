class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
    t.references :client, foreign_key: true
    t.references :trainer, foreign_key: true
    t.date :date
    t.time :time
    end 
  end
end
