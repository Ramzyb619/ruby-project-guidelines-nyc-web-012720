class Client < ActiveRecord::Base
has_many :trainers, through: :appointments 
has_many :appointments 

def create_appointment
    input = gets.chomp
    Appointment.create(client)

end



end 