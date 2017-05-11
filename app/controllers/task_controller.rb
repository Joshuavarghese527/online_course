class TaskController < ApplicationController
  before_action :authenticate_users! 

   def show
    project = Project.find(params[:project_id])
    @tasks = project.tasks.order(:tag)

      joined = false #used @ only when you going to use it for the view. Can still use it but not necessary 

    if !current_user.nil? && !current_user.projects.nil?
      @joined = current_user.projects.include?(project) #if current user joined the project or not
    end

    if joined


    @task = @tasks.find(params[:id])

    @next_task = @task.next
    @prev_task = @task.prev
  else
    flash[:notice] = "No permission to this"
    redirect_to project
  end
end
