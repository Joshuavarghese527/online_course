class NotificationMailer < ApplicationMailer
  default from: "no-reply@worship-course.com"

   def welcome_sign_in
     mail(to: "joshuavarghese527@gmail.com",
         subject: "Welcome HOMie!")
  end
end
