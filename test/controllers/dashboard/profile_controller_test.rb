require 'test_helper'

class Dashboard::ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = users(:staff)
    @admin = users(:administrator)
  end

  test 'As a staff user I should able to get the profile page' do
    sign_in @staff
    get dashboard_profile_index_path
    assert_response :success
  end

  test 'As an admin user I should not able to get the profile page' do
    sign_in @admin
    get dashboard_profile_index_path
    assert_response :success
  end

  test 'As Unauthenticated user I should not able to get the profile page' do
    get dashboard_profile_index_path
    assert_response :redirect
  end

  test 'As a staff user I should able to update my profile' do
    sign_in @staff
    patch dashboard_profile_path(@staff), params: { user: { firstname: 'New firstname', lastname: 'New lastname' } }
    assert_response :redirect
    @staff.reload
    assert_equal 'New firstname', @staff.firstname
    assert_equal 'New lastname', @staff.lastname
  end

  test 'As an admin user I should able to update my profile' do
    sign_in @admin
    patch dashboard_profile_path(@admin), params: { user: { firstname: 'New firstname', lastname: 'New lastname' } }
    assert_response :redirect
    @admin.reload
    assert_equal 'New firstname', @admin.firstname
    assert_equal 'New lastname', @admin.lastname
  end

  test 'As un Unauthenticated user I should not able to update my profile' do
    patch dashboard_profile_path(@admin), params: { user: { firstname: 'New firstname', lastname: 'New lastname' } }
    assert_response :redirect
  end

  test 'As a Staff User I should able to delete my profile account' do
    sign_in @staff
    assert_difference('User.count', -1) do
      delete dashboard_profile_path(@staff)
    end
    assert_response :redirect
  end

  test 'As an Admin User I should able to delete my profile account' do
    sign_in @admin
    assert_difference('User.count', -1) do
      delete dashboard_profile_path(@admin)
    end
    assert_response :redirect
  end

  test 'As un authenticated user I should not able access to profile page' do
    get dashboard_profile_index_path
    assert_response :redirect
    
    assert_no_difference('User.count') do
      delete dashboard_profile_path(@admin)
    end
    assert_response :redirect
  end
end
