

new_admin = Admin.create(email: ENV["EMAIL"], password: ENV["PASSWORD"], password_confirmation: ENV["PASSWORD"])
AdminMailer.confirmation_instructions(new_admin, new_admin.confirmation_token, {password: ENV["PASSWORD"]}).deliver

