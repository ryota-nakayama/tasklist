class TasksController < ApplicationController
  def taskfind
    @task = Task.find(params[:id])
  end  
  
  def index
    @tasks = Task.all
  end
  
  def show
    taskfind
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
    taskfind
  end
  
  def update
    taskfind
    
    if @task.update(task_params)
      flash[:success] = "Task は正常に更新されました"
      redirect_to @task
    else
      flash[:danger] = "Task は更新されませんでした"
      render :edit
    end  
  end
  
  def destroy
    taskfind
    @task.destroy
    
    flash[:success] = "Task は正常に削除されました"
    redirect_to tasks_url
  end  
  
  def task_params
    params.require(:task).permit(:content)
  end  
end

