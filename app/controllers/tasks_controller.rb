class TasksController < ApplicationController
  before_action :set_list, except: [:add_user]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :add_user]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @list.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.list = @list

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@list, @task], notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@list, @task], notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  def add_user
    @task.add_user current_user
    redirect_to tasks_user_url(current_user), notice: 'Task jest nasz'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :body, :time, :status)
    end
end
