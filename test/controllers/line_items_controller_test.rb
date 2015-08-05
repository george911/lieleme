require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, line_item: { city: @line_item.city, email: @line_item.email, job_id: @line_item.job_id, mobile: @line_item.mobile, name: @line_item.name, status: @line_item.status, talent_id: @line_item.talent_id, title: @line_item.title, user_id: @line_item.user_id }
    end

    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { city: @line_item.city, email: @line_item.email, job_id: @line_item.job_id, mobile: @line_item.mobile, name: @line_item.name, status: @line_item.status, talent_id: @line_item.talent_id, title: @line_item.title, user_id: @line_item.user_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
