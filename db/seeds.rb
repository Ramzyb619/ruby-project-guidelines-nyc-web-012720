# Trainer.delete_all
mike = Trainer.create(name:"Mike", specialty:"Rock Climbing")
christina =Trainer.create(name:"Christina", specialty:"Yoga")
arthur = Trainer.create(name:"Arthur", specialty:"Weight Lifting")
yoan = Trainer.create(name:"Yoan", specialty:"Swimming")
andrew = Trainer.create(name:"Andrew", specialty:"Basketball")
# Client.delete_all
ramzy = Client.create(name:"Ramzy")
shabba = Client.create(name:"Shabba")
steven = Client.create(name:"Steven")
alyssa = Client.create(name:"Alyssa")
anthony = Client.create(name:"Anthony")

# Appointment.delete_all
app1 = Appointment.create(trainer_name:"christina",client_name:"ramzy")
app2 = Appointment.create(trainer_name:"yoan",client_name:"anthony")
app3 = Appointment.create(trainer_name:"andrew",client_name:"steven")
app4 = Appointment.create(trainer_name:"arthur",client_name:"shabba")
app5 = Appointment.create(trainer_name:"mike",client_name:"alyssa")





