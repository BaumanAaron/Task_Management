require "application_system_test_case"

class TaskManagerAppsTest < ApplicationSystemTestCase
  setup do
    @task_manager_app = task_manager_apps(:one)
  end

  test "visiting the index" do
    visit task_manager_apps_url
    assert_selector "h1", text: "Task manager apps"
  end

  test "should create task manager app" do
    visit task_manager_apps_url
    click_on "New task manager app"

    fill_in "Catergory", with: @task_manager_app.catergory
    check "Completed" if @task_manager_app.completed
    fill_in "Created", with: @task_manager_app.created
    fill_in "Description", with: @task_manager_app.description
    fill_in "Due", with: @task_manager_app.due
    fill_in "Task", with: @task_manager_app.task
    click_on "Create Task manager app"

    assert_text "Task manager app was successfully created"
    click_on "Back"
  end

  test "should update Task manager app" do
    visit task_manager_app_url(@task_manager_app)
    click_on "Edit this task manager app", match: :first

    fill_in "Catergory", with: @task_manager_app.catergory
    check "Completed" if @task_manager_app.completed
    fill_in "Created", with: @task_manager_app.created
    fill_in "Description", with: @task_manager_app.description
    fill_in "Due", with: @task_manager_app.due
    fill_in "Task", with: @task_manager_app.task
    click_on "Update Task manager app"

    assert_text "Task manager app was successfully updated"
    click_on "Back"
  end

  test "should destroy Task manager app" do
    visit task_manager_app_url(@task_manager_app)
    click_on "Destroy this task manager app", match: :first

    assert_text "Task manager app was successfully destroyed"
  end
end
