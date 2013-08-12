# encoding: utf-8

user = User.create(username: "admin", password: "admin", password_confirmation: "admin", email: "no-reply@icalialabs.com")
user.toggle!(:admin)

Category.create(name: "Plug-ins")
Category.create(name: "Móvil")
Category.create(name: "UI/UX")
Category.create(name: "Front-end")
Category.create(name: "Back-end")
Category.create(name: "Workflow")
Category.create(name: "Otros")
