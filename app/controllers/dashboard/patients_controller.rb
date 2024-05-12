class Dashboard::PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_policy!
  before_action :set_patient


  def index
    respond_to  do |format|
      format.html {
        @filtered_patients = Patient.ransack(params[:q])
        @pagy, @patients = pagy(@filtered_patients.result.order(created_at: :desc), items: 10)
      }
      format.csv {
        send_data Patient.to_csv, filename: "Patients-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"
      }
    end
  end


  def new
    @patient = current_user.patients.new
  end

  def show;end

  def create
    respond_to do |format|
      @patient = current_user.patients.new(patient_params)
      if @patient.save
        format.html { redirect_to dashboard_patient_path(@patient), notice: "Patient successfully created" }
      else
        format.html { redirect_to new_dashboard_patient_path, alert: @patient.errors.full_messages.first }
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to dashboard_patient_path(@patient), notice: "Patient successfully updated" }
      else
        format.html { redirect_to dashboard_patient_path(@patient), alert: @patient.errors.full_messages.first }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @patient.destroy
        format.html { redirect_to dashboard_patients_path, notice: "Patient successfully deleted" }
      else
        format.html { redirect_to dashboard_patients_path, alert: @patient.errors.full_messages.first }
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
        :firstname,
        :middle_initial,
        :lastname,
        :birthdate,
        :age,
        :gender,
        :address_line,
        :contact_number,
        :spo_2,
        :temperature,
        :heart_rate,
        :blood_pressure,
        :weight,
        :height,
        :bmi,
        :length,
        :body_circumference,
        :muac,
        :head_circumference,
        :hip,
        :limbs,
        :z_score
      )
  end
  def set_policy!
    authorize User, policy_class: Dashboard::PatientsPolicy
  end
end
