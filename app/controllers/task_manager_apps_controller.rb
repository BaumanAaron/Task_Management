class TaskManagerAppsController < ApplicationController
  before_action :set_task_manager_app, only: %i[ show edit update destroy ]

  # GET /task_manager_apps or /task_manager_apps.json
  def index
    @task_manager_apps = TaskManagerApp.all
  end

  # GET /task_manager_apps/1 or /task_manager_apps/1.json
  def show
  end

  # GET /task_manager_apps/new
  def new
    @task_manager_app = TaskManagerApp.new
  end
  
  # GET /task_manager_apps/1/edit
  def edit
  end

  # POST /task_manager_apps or /task_manager_apps.json
  def create
    @task_manager_app = TaskManagerApp.new(task_manager_app_params)

    respond_to do |format|
      if @task_manager_app.save
        format.html { redirect_to task_manager_app_url(@task_manager_app), notice: "Task manager app was successfully created." }
        format.json { render :show, status: :created, location: @task_manager_app }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_manager_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_manager_apps/1 or /task_manager_apps/1.json
  def update
    respond_to do |format|
      if @task_manager_app.update(task_manager_app_params)
        format.html { redirect_to task_manager_app_url(@task_manager_app), notice: "Task manager app was successfully updated." }
        format.json { render :show, status: :ok, location: @task_manager_app }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_manager_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_manager_apps/1 or /task_manager_apps/1.json
  def destroy
    @task_manager_app.destroy

    respond_to do |format|
      format.html { redirect_to task_manager_apps_url, notice: "Task manager app was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_manager_app
      @task_manager_app = TaskManagerApp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_manager_app_params
      params.require(:task_manager_app).permit(:task, :description, :catergory, :due, :created, :completed)
    end
end
