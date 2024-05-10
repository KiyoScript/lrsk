class Patients::ConsultsController < ApplicationController
  before_action :set_patient

  def new
    @consult = @patient.consults.new
  end

  def show
    @consult = Consult.find_by_id(params[:id])
    respond_to do |format|
      format.docx {
        filename = "#{@consult.patient.fullname}-consultation-form#{@consult.date}.docx"
        send_data Consult::DocxTemplate.new(@consult).generate, filename: filename
      }
    end
  end

  def create
    @consult = @patient.consults.new(consult_params)
    respond_to do |format|
      if @consult.save
        format.html { redirect_to dashboard_patient_path(@patient), notice: "Consult added successfully to the Patient" }
      else
        format.html { redirect_to new_patients_consult_path, alert: @consult.errors.full_messages.first }
      end
    end
  end


  private
  def set_patient
    @patient = Patient.find_by_id(params[:id])
  end

  def consult_params
    params.require(:consult)
      .permit(
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
      :p
      )
  end
end
