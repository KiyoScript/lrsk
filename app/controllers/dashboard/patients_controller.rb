class Dashboard::PatientsController < ApplicationController
  def index
    @filtered_patients = Patient.ransack(params[:q])
    @pagy, @patients = pagy(@filtered_patients.result.order(created_at: :desc), items: 10)
  end


  private
  def set_patient
    @patient = Patient.find_by_id(params[:id])
  end
end
