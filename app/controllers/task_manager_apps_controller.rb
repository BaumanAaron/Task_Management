class TaskManagerAppsController < ApplicationController
  before_action :set_task_manager_app, only: %i[ show edit update destroy ]


  # GET /task_manager_apps or /task_manager_apps.json
  def index
    @task_manager_apps = TaskManagerApp.all

    @task_manager_apps = case params[:sort]
             when 'task'
               @task_manager_apps.alphabetical_task(params[:direction] || 'asc')
             when 'description'
               @task_manager_apps.alphabetical_desc(params[:direction] || 'asc')
             when 'category'
               @task_manager_apps.category_order(params[:direction] || 'asc')
             when 'due'
               @task_manager_apps.due_order(params[:direction] || 'asc')
             when 'completed'
               @task_manager_apps.completed_order(params[:direction] || 'asc')
            else
              # Default sorting by completed (completed first) and then by due (earliest due date first)
              @task_manager_apps = @task_manager_apps.order(completed: :desc, due: :asc)
             end
  end

  def tasks_within_date_range
    start_date = params[:start_date]
    end_date = params[:end_date]

    if start_date.present? && end_date.present?
      start_date = start_date.to_date.beginning_of_day
      end_date = end_date.to_date.end_of_day

      @tasks_within_date_range = TaskManagerApp.where(due: start_date..end_date).order(completed: :desc, due: :asc)

    else
      @tasks_within_date_range = TaskManagerApp.all.order(completed: :desc, due: :asc)

    end

    render 'tasks_within_date_range'
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
        format.html { redirect_to task_manager_app_url(@task_manager_app), notice: "Task was successfully created." }
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
        format.html { redirect_to task_manager_app_url(@task_manager_app), notice: "Task was successfully updated." }
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
      format.html { redirect_to task_manager_apps_url, notice: "Task was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def tasks_on_date
    specified_date = params[:date]
    date_range = specified_date.to_date.beginning_of_day..specified_date.to_date.end_of_day
    @tasks_on_date = TaskManagerApp.where(due: date_range)
  end

  def task_manager_app_params
    params.require(:task_manager_app).permit(:task, :description, :catergory, :due, :created_at, :completed, :confirm, :delete)
  end


  private
    def set_created
      self.created ||=Date.current
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task_manager_app
      @task_manager_app = TaskManagerApp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_manager_app_params
      params.require(:task_manager_app).permit(:task, :description, :catergory, :due, :created, :completed, :confirm, :delete)
    end
end
