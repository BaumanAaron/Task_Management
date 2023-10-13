require "test_helper"

class TaskManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_manager = task_managers(:one)
  end

  test "should get index" do
    get task_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_task_manager_url
    assert_response :success
  end

  test "should create task_manager" do
    assert_difference("TaskManager.count") do
      post task_managers_url, params: { task_manager: { Completed: @task_manager.Completed, Description: @task_manager.Description, Due: @task_manager.Due, Task: @task_manager.Task } }
    end

    assert_redirected_to task_manager_url(TaskManager.last)
  end

  test "should show task_manager" do
    get task_manager_url(@task_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_manager_url(@task_manager)
    assert_response :success
  end

  test "should update task_manager" do
    patch task_manager_url(@task_manager), params: { task_manager: { Completed: @task_manager.Completed, Description: @task_manager.Description, Due: @task_manager.Due, Task: @task_manager.Task } }
    assert_redirected_to task_manager_url(@task_manager)
  end

  test "should destroy task_manager" do
    assert_difference("TaskManager.count", -1) do
      delete task_manager_url(@task_manager)
    end

    assert_redirected_to task_managers_url
  end
end
