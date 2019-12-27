# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview
    def confirmation_instructions
        AdminMailer.confirmation_instructions(Admin.new(email:"test"), "FakeToken", {password: "fake-password"})
    end
end
