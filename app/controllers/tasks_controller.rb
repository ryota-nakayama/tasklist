class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end
  
  def show
    find_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Task が作成されました"
      redirect_to @task
    else
      flash[:danger] = "Task が作成されませんでした"
      render :new
    end  
  end  
  
  def edit
    find_task
  end
  
  def update
    find_task
    
    if @task.update(task_params)
      flash[:success] = "Task は正常に更新されました"
      redirect_to @task
    else
      flash[:danger] = "Task は更新されませんでした"
      render :edit
    end  
  end
  
  def destroy
    find_task
    @task.destroy
    
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
  end  
  
  private
  
  def find_task
    @task = Task.find(params[:id])
  end  
  
  
  def task_params
    params.require(:task).permit(:content, :status)
  end  
end

