class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    # no need for app/views/tasks/create.html.erb
    redirect_to tasks_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    # @task.update(params[:task])
    @task.update(task_params)
    redirect_to task_path(@task)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params # validacion
    params.require(:task).permit(:title, :details, :completed)
  end

end
