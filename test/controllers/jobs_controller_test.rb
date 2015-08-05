require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post :create, job: { addr: @job.addr, allowance: @job.allowance, base_pay: @job.base_pay, bonus: @job.bonus, city: @job.city, commission: @job.commission, company_info: @job.company_info, concall_date: @job.concall_date, industry: @job.industry, memo: @job.memo, month: @job.month, peer: @job.peer, requirement: @job.requirement, role: @job.role, stock: @job.stock, stock_num: @job.stock_num, title: @job.title, user_id: @job.user_id, work_year: @job.work_year }
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should show job" do
    get :show, id: @job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job
    assert_response :success
  end

  test "should update job" do
    patch :update, id: @job, job: { addr: @job.addr, allowance: @job.allowance, base_pay: @job.base_pay, bonus: @job.bonus, city: @job.city, commission: @job.commission, company_info: @job.company_info, concall_date: @job.concall_date, industry: @job.industry, memo: @job.memo, month: @job.month, peer: @job.peer, requirement: @job.requirement, role: @job.role, stock: @job.stock, stock_num: @job.stock_num, title: @job.title, user_id: @job.user_id, work_year: @job.work_year }
    assert_redirected_to job_path(assigns(:job))
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end
end
