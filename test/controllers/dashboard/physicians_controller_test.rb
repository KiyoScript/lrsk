require "test_helper"

class Dashboard::PhysiciansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = users(:staff)
    @admin = users(:administrator)
    @physician = physicians(:one)
  end

  test 'As a staff user, I not should be able to view all physicians' do
    sign_in @staff
    get dashboard_physicians_url
    assert_response :redirect
  end

  test 'As an admin user, I should be able to view all physicians' do
    sign_in @admin
    get dashboard_physicians_url
    assert_response :success
  end

  test 'As Unauthorized user, I should not be able to view physicians' do
    get dashboard_physicians_url
    assert_response :redirect
  end

  test 'should not be able to get new' do
    sign_in @staff
    get new_dashboard_physician_url
    assert_response :redirect
  end

  test 'As a staff user, I should not be able to create physician' do
    sign_in @staff
    assert_no_difference('Physician.count') do
      post dashboard_physicians_url, params: {
        physician: {
          user_id: @physician.user_id,
          firstname: @physician.firstname,
          middle_initial: @physician.middle_initial,
          lastname: @physician.lastname,
          gender: @physician.gender,
          email_address: @physician.email_address,
          contact_number: @physician.contact_number
        }
      }
    end
  end

  test 'As an admin user, I should create physician' do
    sign_in @admin
    assert_difference('Physician.count') do
      post dashboard_physicians_url, params: {
        physician: {
          user_id: @physician.user_id,
          firstname: @physician.firstname,
          middle_initial: @physician.middle_initial,
          lastname: @physician.lastname,
          gender: @physician.gender,
          email_address: @physician.email_address,
          contact_number: @physician.contact_number
        }
      }
    end
  end

  test 'As unauthorized user, I should not create physician' do
    assert_no_difference('Physician.count') do
      post dashboard_physicians_url, params: {
        physician: {
          user_id: @physician.user_id,
          firstname: @physician.firstname,
          middle_initial: @physician.middle_initial,
          lastname: @physician.lastname,
          gender: @physician.gender,
          email_address: @physician.email_address,
          contact_number: @physician.contact_number
        }
      }
    end
  end

  test 'As a staff user, I should not able to view physician' do
    sign_in @staff
    get dashboard_physician_url(@physician)
    assert_response :redirect
  end

  test 'As an admin user, I should able to view physician' do
    sign_in @admin
    get dashboard_physician_url(@physician)
    assert_response :success
  end

  test 'As unauthorized user, I should not able to view physician' do
    get dashboard_physician_url(@physician)
    assert_response :redirect
  end

  test 'As a staff user, I should not able to edit physician' do
    sign_in @staff
    get edit_dashboard_physician_path(@physician)
    assert_response :redirect
  end

  test 'As an admin user, I should able to edit physician' do
    sign_in @admin
    get edit_dashboard_physician_url(@physician)
    assert_response :success
  end

  test 'As unauthorized user, I should not able to edit physician' do
    get edit_dashboard_physician_url(@physician)
    assert_response :redirect
  end

  test 'As a staff user, I should not able to update physician' do
    sign_in @staff
    patch dashboard_physician_url(@physician), params: {
      firstname: @physician.firstname,
      middle_initial: @physician.middle_initial,
      lastname: @physician.lastname
    }
    assert_response :redirect
  end

  test 'As an admin user, I should able to update physician' do
    sign_in @admin
    patch dashboard_physician_url(@physician), params: {
      physician: {
        firstname: @physician.firstname,
        middle_initial: @physician.middle_initial,
        lastname: @physician.lastname
      }
    }
    assert_redirected_to dashboard_physician_url(@physician)
  end

  test 'As unauthorized user, I should not able to update physician' do
    patch dashboard_physician_url(@physician), params: {
      firstname: @physician.firstname,
      middle_initial: @physician.middle_initial,
      lastname: @physician.lastname
    }
    assert_response :redirect
  end

  test 'As a staff user, I should not able to destroy physician' do
    sign_in @staff
    assert_no_difference('Physician.count', -1) do
      delete dashboard_physician_url(@physician)
    end
  end

  test 'As an admin user, I should able to destroy physician' do
    sign_in @admin
    assert_difference('Physician.count', -1) do
      delete dashboard_physician_url(@physician)
    end
    assert_redirected_to dashboard_physicians_url
  end

  test 'As unauthorized user, I should not able to destroy physician' do
    assert_no_difference('Physician.count', -1) do
      delete dashboard_physician_url(@physician)
    end
  end

end
