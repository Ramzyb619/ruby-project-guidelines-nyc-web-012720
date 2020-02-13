class Trainer < ActiveRecord::Base
has_many :clients, through: :appointments
has_many :appointments
 
# #list all trainers 
# def list_all_trainers
# Trainers.all
# end 




end 