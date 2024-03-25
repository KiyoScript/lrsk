class Dashboard::PatientsController < ApplicationController
  def index
    @filtered_patients = Patient.ransack(params[:q])
    @pagy, @patients = pagy(@filtered_patients.result.order(created_at: :desc), items: 10)
  end


  def new
    @patient = current_user.patients.new
    @patient.consults.build
  end


  def create
    respond_to do |format|
      @patient = current_user.patients.new(patient_params)
      if @patient.save
        format.html { redirect_to dashboard_patients_path, notice: "Patient successfully created" }
      else
        format.html { redirect_to new_dashboard_patient_path, alert: @patient.errors.full_messages.first }
      end
    end
  end

  private

  def set_patient
    @patient = Patient.find_by_id(params[:id])
  end
  def patient_params
    params.require(:patient)
      .permit(
        :user_id,
        :fullname,
        :birthdate,
        :age,
        :gender,
        :details_address,
        :details_contact_number,
        :length,
        :body_circumference,
        :muac,
        :head_circumference,
        :hip,
        :limbs,
        :z_score,
        consults_attributes: [
          :id,
          :date,
          :time,
          :reason,
          :s,
          :blood_pressure,
          :heart_rate,
          :rr,
          :temperature,
          :spo_2,
          :weight,
          :height,
          :bmi,
          :o,
          :a,
          :p,
          :_destroy
        ]
      )
  end
end
