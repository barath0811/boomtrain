require 'test_helper'

class TicketTimesControllerTest < ActionController::TestCase
  setup do
    @ticket_time = ticket_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_time" do
    assert_difference('TicketTime.count') do
      post :create, ticket_time: { entry: @ticket_time.entry, exit: @ticket_time.exit }
    end

    assert_redirected_to ticket_time_path(assigns(:ticket_time))
  end

  test "should show ticket_time" do
    get :show, id: @ticket_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket_time
    assert_response :success
  end

  test "should update ticket_time" do
    patch :update, id: @ticket_time, ticket_time: { entry: @ticket_time.entry, exit: @ticket_time.exit }
    assert_redirected_to ticket_time_path(assigns(:ticket_time))
  end

  test "should destroy ticket_time" do
    assert_difference('TicketTime.count', -1) do
      delete :destroy, id: @ticket_time
    end

    assert_redirected_to ticket_times_path
  end
end
