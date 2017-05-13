class MyMailer < ActionMailer::Base

def new_user(user)
    template_id = "template_id_of_new_user"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "Welcome to WorshipCourse"
        }
      ],
      "from": {
        "email": "worshipcourse@gmail.com"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end

  def new_user(user)
    template_name = "new-user"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "Welcome to WorshipCourse",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [{name: "USER_NAME", content: user.name}]
        }
      ]
    }

    sendgrid_client.messages.send_template template_name, template_content, message
  end

  def new_receipt(user, project)
    template_name = "new-receipt"
    template_content = []
    message = {
      to: [{email: "#{user.email}"}],
      subject: "WorshipCourse - Your Receipt",
      merge_vars: [
        {
          rcpt: user.email,
          vars: [
            {name: "STUDENT_NAME", content: user.name},
            {name: "PROJECT_NAME", content: project.name},
            {name: "PROJECT_PRICE", content: project.price}
          ]
        }
      ]
    }
    
    sendgrid_client.messages.send_template template_name, template_content, message
  end
end