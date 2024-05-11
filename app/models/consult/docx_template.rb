require 'sablon'

class Consult::DocxTemplate
  def initialize(consult)
    @consult = consult
  end

  def generate
    template_path = Rails.root.join('lib', 'docx_template', 'consultation_template.docx')
    template = Sablon.template(File.expand_path(template_path))

    context = {
      consult: {
        "date" => @consult.date.strftime("%b %d, %Y"),
        "time" => @consult.time.strftime("%I:%M %p"),
        "reason" => @consult.reason,
        "s" => @consult.s,
        "blood_pressure" => @consult.patient.blood_pressure,
        "heart_rate" => @consult.patient.heart_rate,
        "rr" => @consult.rr,
        "temperature" => @consult.patient.temperature,
        "spo_2" => @consult.patient.spo_2,
        "weight" => @consult.patient.weight,
        "height" => @consult.patient.height,
        "bmi" => @consult.patient.bmi,
        "o" => @consult.o,
        "a" => @consult.a,
        "p" => @consult.p,
        "patient" => {
          "fullname" => @consult.patient.fullname,
          "age" => @consult.patient.age,
          "gender" => @consult.patient.gender.capitalize
        }
      }
    }

    template.render_to_string(context)
  end
end
