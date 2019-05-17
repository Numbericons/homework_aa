class UserMailer < ApplicationMailer
    default from: 'super@awesome.com'

    def welcome_email(user)
        @user = user
        @url = 'http://awesome.com/login'
        mail(to: user.email, subject: 'Hello buddy!')
    end
end
