class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  before_action :authenticate_user!

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(@board), notice: '保存完了'
    else
      flash.now[:error] = '保存失敗'
      render :new
    end
  end
    
  def show
  end

  def edit
    @task = current_user.tasks.find(params[:board_id])
  end

  def destroy
    task = current_user.tasks.find(params[:board_id])
    task.destroy!
    redirect_to board_path(board), notice: '削除成功'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:board_id])
  end
end