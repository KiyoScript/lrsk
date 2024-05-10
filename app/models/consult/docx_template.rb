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
        "blood_pressure" => @consult.blood_pressure,
        "heart_rate" => @consult.heart_rate,
        "rr" => @consult.rr,
        "temperature" => @consult.temperature,
        "spo_2" => @consult.spo_2,
        "weight" => @consult.weight,
        "height" => @consult.height,
        "bmi" => @consult.bmi,
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
