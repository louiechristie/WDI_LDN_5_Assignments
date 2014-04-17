class UserMailer < ActionMailer::Base
  
  default from: "mike.mj.harris@gmail.com"

    def test
        @user = "mike.mj.harris@gmail.com"
        @url  = 'http://example.com/login'
        mail(to: @user, subject: 'Welcome to My Awesome Site')

    end



end

