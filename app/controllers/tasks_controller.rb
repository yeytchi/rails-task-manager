class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # show all tasks
  end

  def show
    id = params['id']
    @task = Task.find(id)
    # show selected task
  end

  def new
    # get information for new task
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to root_path
  end

  def edit
    @task = Task.find(params['id'])
  end

  def update
    @task = Task.find(params['id'])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
