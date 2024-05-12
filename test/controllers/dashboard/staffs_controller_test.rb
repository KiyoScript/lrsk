require 'test_helper'

class Dashboard::StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = users(:staff)
    @admin = users(:administrator)
  end

  test 'As a Staff User I should able to access the staff index page' do
    sign_in @staff
    get dashboard_staffs_path
    assert :success
  end

  test 'As a Admin User I should able to access the staff index page' do
    sign_in @admin
    get dashboard_staffs_path
    assert :success
  end

  test 'As Unauthenticated User I should not able to access the staff index page' do
    get dashboard_staffs_path
    assert :redirect
  end

  test 'As a Staff User I should able to view staff profile page' do
    sign_in @staff
    get dashboard_staff_path(@staff)
    assert :success
  end

  test 'As an Admin User I should able to view staff profile page' do
    sign_in @admin
    get dashboard_staff_path(@staff)
    assert :success
  end

  test 'As Unauthenticated User I should not able to view staff profile page' do
    get dashboard_staff_path(@staff)
    assert :redirect
  end

  test 'As an Staff User I should not be able to update other staff' do
    sign_in @staff
    patch dashboard_staff_path(@staff), params: { user: { firstname: 'New firstname', lastname: 'New lastname' } }
    assert :redirect
  end

  test 'As an Admin User I should able to update other staff' do
    sign_in @admin
    patch dashboard_staff_path(@staff), params: { user: { firstname: 'New firstname', lastname: 'New lastname' } }
    assert :success
    @staff.reload
    assert_equal 'New firstname', @staff.firstname
    assert_equal 'New lastname', @staff.lastname
  end

  test 'As un Unauthorized User I shoule not able to access the edit page' do
    get edit_dashboard_staff_path(@staff)
    assert :redirect
  end

  test 'As a staff user, I should not able to destroy staff' do
    sign_in @staff
    assert_no_difference('User.count', -1) do
      delete dashboard_staff_path(@staff)
    end
  end

  test 'As an admin user, I should able to destroy patient' do
    sign_in @admin
    assert_difference('User.count', -1) do
      delete dashboard_staff_path(@staff)
    end
  end

  test 'As unauthorized user, I should not able to destroy patient' do
    assert_no_difference('User.count', -1) do
      delete dashboard_staff_path(@staff)
    end
  end
end
