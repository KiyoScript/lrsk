class Patients::PhysicalExaminationsController < ApplicationController
  before_action :set_patient


  def new
    @physical_examination = @patient.physical_examinations.new
  end

  def create
    @physical_examination = @patient.physical_examinations.new(physical_examination_params)
    respond_to do |format|
      if @physical_examination.save
        format.html { redirect_to dashboard_patient_path(@patient), notice: "Physical Examination added successfully to the Patient" }
      else
        format.html { redirect_to new_patients_physical_examination_path, alert: @physical_examination.errors.full_messages.first }
      end
    end
  end


  private
  def set_patient
    @patient = Patient.find_by_id(params[:id])
  end

  def physical_examination_params
    params.require(:physical_examination).permit(
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
      :date
      )
  end
end
