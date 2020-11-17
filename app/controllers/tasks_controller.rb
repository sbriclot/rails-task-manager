class TasksController < ApplicationController
  before_action :select_task, only: [:show, :edit, :update, :destroy]

  # list all tasks
  def index
    @tasks = Task.all
  end

  # read 1 task details
  def show
  end

  # generate a new task
  def new
    @task = Task.new
  end

  # save the new task
  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to root_path
  end

  # edit the task
  def edit
  end

  # update the task
  def update
    @task.update(task_params)

    redirect_to root_path
  end

  def destroy
    @task.destroy

    redirect_to root_path
  end

  private

  def select_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
