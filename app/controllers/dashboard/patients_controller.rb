class Dashboard::PatientsController < ApplicationController
  before_action :set_patient

  def index
    @filtered_patients = Patient.ransack(params[:q])
    @pagy, @patients = pagy(@filtered_patients.result.order(created_at: :desc), items: 10)
  end


  def new
    @patient = current_user.patients.new
    @patient.consults.build
    @patient.physical_examinations.build
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
        ],
        physical_examinations_attributes: [
          :right_eye,
          :left_eye,
          :both_eyes,
          :heent,
          :neck,
          :chest_lungs,
          :heart,
          :breast,
          :abdomen,
          :gut,
          :extremities,
          :musculoskeletal,
          :neurological,
          :skin,
          :others,
          :complete_blood_count,
          :urinalysis,
          :fecalysis,
          :chest_xray,
          :fasting_blood_sugar,
          :lipid_profile,
          :blood_uric_acid,
          :ecg_12_leads,
          :drug_test,
          :sputum_genexpert,
          :hbsag,
          :others_1,
          :diagnosis,
          :plan,
          :district_physician,
          :date,
          :_destroy
        ]
      )
  end
end
