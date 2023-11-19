require_relative 'main_application'

user_data = { username: "JohnDoe", email: "john@example.com" }

app = MainApplication.new(user_data)
app.run