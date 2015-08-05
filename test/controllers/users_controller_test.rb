require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { base_salary: @user.base_salary, birthday: @user.birthday, bonus: @user.bonus, city: @user.city, email: @user.email, expect_month_salary: @user.expect_month_salary, expect_package: @user.expect_package, housing: @user.housing, mobile: @user.mobile, month_num: @user.month_num, retention_bonus: @user.retention_bonus, stock: @user.stock, stock_num: @user.stock_num, title: @user.title, transport: @user.transport, true_name: @user.true_name, user_name: @user.user_name, user_type: @user.user_type }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { base_salary: @user.base_salary, birthday: @user.birthday, bonus: @user.bonus, city: @user.city, email: @user.email, expect_month_salary: @user.expect_month_salary, expect_package: @user.expect_package, housing: @user.housing, mobile: @user.mobile, month_num: @user.month_num, retention_bonus: @user.retention_bonus, stock: @user.stock, stock_num: @user.stock_num, title: @user.title, transport: @user.transport, true_name: @user.true_name, user_name: @user.user_name, user_type: @user.user_type }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
