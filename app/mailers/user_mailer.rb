class UserMailer < ApplicationMailer

    default from: "from@example.com"
  
  def admin_created(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been created!') 
  end

  def admin_deleted(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted by an administrator')
  end
end
