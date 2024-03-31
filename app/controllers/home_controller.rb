class HomeController < ApplicationController
  include StaffAccessible
  def index
    @total_patient_of_tambulilid = Patient.total_patients_by_address_line('Brgy. Tambulilid')
    @total_patient_of_linao = Patient.total_patients_by_address_line('Brgy. Linao')
    @total_patient_of_naungan = Patient.total_patients_by_address_line('Brgy. Naungan')
    @total_patient_of_punta = Patient.total_patients_by_address_line('Brgy. Punta')
  end
end
