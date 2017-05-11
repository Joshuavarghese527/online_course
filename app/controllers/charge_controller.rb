class ChargeController < ApplicationController
before_action :authenticate_user! #user needs to be logged in

def free
    project = Project.find(params[:project_id])
    current_user.subscriptions.create(project: project)

    redirect_to project
  end
end