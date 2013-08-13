# encoding: utf-8

user = User.create(username: "admin", 
                   password: "admin", 
                   password_confirmation: "admin", 
                   email: "admin@icalialabs.com")
user.toggle!(:admin)
