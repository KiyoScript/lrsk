require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_user = users(:staff)
    @admin_user = users(:administrator)
    @unregistered_user = users(:unregistered)
  end

  test 'public user should redirect to the sign in page' do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test 'staff user should be able to access the home page' do
    sign_in @staff_user
    get root_path
    assert_response :success
  end

  test 'administrator user should be able to access the home page' do
    sign_in @admin_user
    get root_path
    assert_response :success
  end

  test 'unregistered user should not be able to access the home page' do
    sign_in @unregistered_user
    get root_path
    assert_response :redirect
  end

  test 'unregistered user should redirected to the welcome page when trying to access the home page' do
    sign_in @unregistered_user
    get root_path
    assert_redirected_to welcome_path
  end
end
