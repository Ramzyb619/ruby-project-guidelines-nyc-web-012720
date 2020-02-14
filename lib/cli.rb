require 'tty-prompt'
require 'Date'
class CLI

  def greet
    puts "Welcome to Ramzy's gym!"
  end
        

  def run
    action_entered = ""
    while action_entered != "exit"
     prompt = TTY::Prompt.new
     action_entered = prompt.select("What would you like to do?", ["create", "view/update", "delete", "exit"])        
      if action_entered == "create"
        create
      elsif action_entered == "view/update"
        view_update
      elsif action_entered == "delete"
        delete
      end
    end
  end

# create an appointment
  def create 
    print_trainers (Trainer.all)    
    p "Enter a trainer you want to meet with:"
    trainer_name_entered = gets.chomp 
    #finds the trainer in the data base and pulls it into my code
  	trainer = Trainer.find_by!(name: trainer_name_entered)
  	p "Enter your name:"
    client_name_entered = gets.chomp
    #access client class, find the name of the client, if it cant find, then it creates new client
  	new_client = Client.find_or_create_by(name: client_name_entered)
    p "Please pick a date and time would you like to meet? (yyyy/mm/dd hh:mm)"
    date_time_entered = gets.chomp
    #convert the time that the user entered into an instance of time
    inputs = date_time_entered.split(/\D/)
    appointment_date_time = DateTime.new(inputs[0].to_i,inputs[1].to_i,inputs[2].to_i, inputs[3].to_i, inputs[4].to_i)

    new_appointment = Appointment.create(trainer_id: trainer.id, client_id: new_client.id, date: appointment_date_time, time: appointment_date_time)
    p "We set up an appointment for you and #{trainer.name}!"
    
  end

  # view and update appointments
  def view_update
    p "Enter your name:"
     client_name_entered = gets.chomp
     #find the client in the data base
    client = Client.find_by!(name: client_name_entered)
    p "Here are your current appointments:"
    #goes through print appointments method and take the argument of the client with all his appointments
    print_appointments (client.appointments)
    p "Would you like to update any?(y/n)"
    y_n_entered = gets.chomp.downcase
    	
    if y_n_entered == "y"
      	p "Which appointment would you like to update? (Enter a trainer name)"
        trainer_name = gets.chomp
        #enter the data base and find an appointment by trainer name 
        trainer = Trainer.find_by(name: trainer_name)
      	appointment = Appointment.find_by(trainer_id: trainer.id)
        p "What trainer would you like to meet with instead?"
        #print out all the trainers
        print_trainers (Trainer.all)    
        new_trainer_name_entered = gets.strip
        #go into data base and find the new trainer name you entered
        p new_trainer_name_entered

        new_trainer = Trainer.find_by(name: new_trainer_name_entered)
        #link it to the appointment 
        # binding.pry
        appointment.update(trainer_id: new_trainer.id)
        p "Your appointment has been updated!"
    end
  end

   # delete an appointment
   def delete
    p "Enter your name:"
    client_name_entered = gets.chomp
    #going into data base and finding the client name that user entered 
    client = Client.find_by!(name: client_name_entered)
    p "Here are your current appointments:"
    # prints appointments of the specific client 
    print_appointments(client.appointments)
    p "Which appointment would you like to delete? (enter the trainer name)"
    trainer_name_entered = gets.chomp
    trainer = Trainer.find_by(name: trainer_name_entered)
    #goes into data base and finds the appointment you want to delete by trainer name
    appointment = Appointment.find_by(trainer_id: trainer.id, client_id: client.id)
    appointment.destroy
    p "Your appointment has been deleted!"
  end

    #takes in array of appointments and prints it out 
    def print_appointments (appointments)
      appointments.each do |appt|
        appt = Appointment.find(appt.id)
        #.time is a ruby object. strftime is a method that every time object has. %I - hour of the day (12 hour), %M is minute, %P am or PM
      puts "you have an appointment with #{appt.trainer.name} on #{appt.date} at #{appt.time.strftime("%I:%M:%P")}"
      end 
    end

#takes in array of trainers and prints it out
    def print_trainers (trainers)
      trainers.map { |trainer| puts "#{trainer.name}: #{trainer.specialty}"}.join(", ")
    end 
end
 

