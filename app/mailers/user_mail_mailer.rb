class UserMailMailer < ApplicationMailer

  def submission(email)
    #this can be call from any controller and this can access params value from the controller too
    # just act as a controller after this it will require the view file
    @url = "http://localhost:3000/homepage"
    mail(to:email, subject: 'Top Books for this week')
  end
end
