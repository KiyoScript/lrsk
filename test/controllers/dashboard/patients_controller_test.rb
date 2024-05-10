require 'test_helper'

class Dashboard::PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = users(:staff)
    @admin = users(:administrator)
    @patient = patients(:one)
  end

  test 'As a staff user, I should be able to view my patients' do
    sign_in @staff
    get dashboard_patients_url
    assert_response :success
  end

  test 'As an admin user, I should be able to view all patients' do
    sign_in @admin
    get dashboard_patients_url
    assert_response :success
  end

  test 'As Unauthorized user, I should not be able to view patients' do
    get dashboard_patients_url
    assert_response :redirect
  end

  test 'should get new' do
    sign_in @staff
    get new_dashboard_patient_url
    assert_response :success
  end

  test 'As a staff user, I should create patient' do
    sign_in @staff
    assert_difference('Patient.count') do
      post dashboard_patients_url, params: {
        patient: {
          user_id: @patient.user_id,
          firstname: @patient.firstname,
          middle_initial: @patient.middle_initial,
          lastname: @patient.lastname,
          birthdate: @patient.birthdate,
          age: @patient.age,
          gender: @patient.gender,
          address_line: @patient.address_line,
          contact_number: @patient.contact_number
        }
      }
    end

    assert_redirected_to dashboard_patient_url(Patient.last)
  end

  test 'As an admin user, I should create patient' do
    sign_in @admin
    assert_difference('Patient.count') do
      post dashboard_patients_url, params: {
        patient: {
          user_id: @patient.user_id,
          firstname: @patient.firstname,
          middle_initial: @patient.middle_initial,
          lastname: @patient.lastname,
          birthdate: @patient.birthdate,
          age: @patient.age,
          gender: @patient.gender,
          address_line: @patient.address_line,
          contact_number: @patient.contact_number
        }
      }
    end
  end

  test 'As unauthorized user, I should not create patient' do
    assert_no_difference('Patient.count') do
      post dashboard_patients_url, params: {
        patient: {
          user_id: @patient.user_id,
          firstname: @patient.firstname,
          middle_initial: @patient.middle_initial,
          lastname: @patient.lastname,
          birthdate: @patient.birthdate,
          age: @patient.age,
          gender: @patient.gender,
          address_line: @patient.address_line,
          contact_number: @patient.contact_number
        }
      }
    end
  end

  test 'As a staff user, I should able to view patient' do
    sign_in @staff
    get dashboard_patient_url(@patient)
    assert_response :success
  end

  test 'As an admin user, I should able to view patient' do
    sign_in @admin
    get dashboard_patient_url(@patient)
    assert_response :success
  end

  test 'As unauthorized user, I should not able to view patient' do
    get dashboard_patient_url(@patient)
    assert_response :redirect
  end

  test 'As a staff user, I should able to edit patient' do
    sign_in @staff
    get edit_dashboard_patient_url(@patient)
    assert_response :success
  end

  test 'As an admin user, I should able to edit patient' do
    sign_in @admin
    get edit_dashboard_patient_url(@patient)
    assert_response :success
  end

  test 'As unauthorized user, I should not able to edit patient' do
    get edit_dashboard_patient_url(@patient)
    assert_response :redirect
  end

  test 'As a staff user, I should able to update patient' do
    sign_in @staff
    patch dashboard_patient_url(@patient), params: {
      patient: {
        firstname: @patient.firstname,
        middle_initial: @patient.middle_initial,
        lastname: @patient.lastname
      }
    }
    assert_redirected_to dashboard_patient_url(@patient)
  end

  test 'As an admin user, I should able to update patient' do
    sign_in @admin
    patch dashboard_patient_url(@patient), params: {
      patient: {
        firstname: @patient.firstname,
        middle_initial: @patient.middle_initial,
        lastname: @patient.lastname
      }
    }
    assert_redirected_to dashboard_patient_url(@patient)
  end

  test 'As unauthorized user, I should not able to update patient' do
    patch dashboard_patient_url(@patient), params: {
      firstname: @patient.firstname,
      middle_initial: @patient.middle_initial,
      lastname: @patient.lastname
    }
    assert_response :redirect
  end

  test 'As a staff user, I should able to destroy patient' do
    sign_in @staff
    assert_difference('Patient.count', -1) do
      delete dashboard_patient_url(@patient)
    end

    assert_redirected_to dashboard_patients_url
  end

  test 'As an admin user, I should able to destroy patient' do
    sign_in @admin
    assert_difference('Patient.count', -1) do
      delete dashboard_patient_url(@patient)
    end
  end

  test 'As unauthorized user, I should not able to destroy patient' do
    assert_no_difference('Patient.count', -1) do
      delete dashboard_patient_url(@patient)
    end
  end

end
