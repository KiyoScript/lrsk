require 'sablon'

class PhysicalExamination::DocxTemplate
  def initialize(physical_examination)
    @physical_examination = physical_examination
  end

  def generate
    template_path = Rails.root.join('lib', 'docx_template', 'physical_examination_template.docx')
    template = Sablon.template(File.expand_path(template_path))

    context = {
      patient: {
        "fullname" => @physical_examination.patient.fullname,
        "age" => @physical_examination.patient.age,
        "date" => @physical_examination.date.strftime("%b %d, %Y")
      },
      "bp" => @physical_examination.patient.blood_pressure,
      "hr" => @physical_examination.patient.heart_rate,
      "sp" => @physical_examination.patient.spo_2,
      "tp" => @physical_examination.patient.temperature,
      "ht" => @physical_examination.patient.height,
      "wt" => @physical_examination.patient.weight,
      "bmi" => @physical_examination.patient.bmi,
      "lt" => @physical_examination.patient.length,
      "bc" => @physical_examination.patient.body_circumference,
      "mc" => @physical_examination.patient.muac,
      "hc" => @physical_examination.patient.head_circumference,
      "hp" => @physical_examination.patient.hip,
      "limbs" => @physical_examination.patient.limbs,
      "zscore" => @physical_examination.patient.z_score,
      "xr" => @physical_examination.right_eye? ? '___' : '_✔_',
      "yr" => @physical_examination.right_eye? ? '_✔_': '___',
      "xl" => @physical_examination.left_eye? ? '___' : '_✔_',
      "yl" => @physical_examination.left_eye? ? '_✔_': '___',
      "xb" => @physical_examination.both_eyes? ? '___' : '_✔_',
      "yb" => @physical_examination.both_eyes? ? '_✔_': '___',
      "hy" => @physical_examination.heent == 'yes' ? '✔' : '',
      "ha" => @physical_examination.heent == 'yes' ? '' : @physical_examination.heent,
      "ny" => @physical_examination.neck == 'yes' ? '✔' : '',
      "na" => @physical_examination.neck == 'yes' ? '' : @physical_examination.neck,
      "cy" => @physical_examination.chest_lungs == 'yes' ? '✔' : '',
      "ca" => @physical_examination.chest_lungs == 'yes' ? '' : @physical_examination.chest_lungs,
      "ey" => @physical_examination.heart == 'yes' ? '✔' : '',
      "ea" => @physical_examination.heart == 'yes' ? '' : @physical_examination.heart,
      "breasty" => @physical_examination.breast == 'yes' ? '✔' : '',
      "breasta" => @physical_examination.breast == 'yes' ? '' : @physical_examination.breast,
      "abdomeny" => @physical_examination.abdomen == 'yes' ? '✔' : '',
      "abdomena" => @physical_examination.abdomen == 'yes' ? '' : @physical_examination.abdomen,
      "guty" => @physical_examination.gut == 'yes' ? '✔' : '',
      "guta" => @physical_examination.gut == 'yes' ? ' ' : @physical_examination.gut,
      "exty" => @physical_examination.extremities == 'yes' ? '✔' : '',
      "exta" => @physical_examination.extremities == 'yes' ? '': @physical_examination.extremities,
      "musy" => @physical_examination.musculoskeletal == 'yes' ? '✔' : '',
      "musa" => @physical_examination.musculoskeletal == 'yes' ? '' : @physical_examination.musculoskeletal,
      "nury" => @physical_examination.neurological == 'yes' ? '✔' : '',
      "nura" => @physical_examination.neurological == 'yes' ? '' : @physical_examination.neurological,
      "skiny" => @physical_examination.skin == 'yes' ? '✔' : '',
      "skina" => @physical_examination.skin == 'yes' ? '' : @physical_examination.skin,
      "others" => @physical_examination.others,
      "cpcy" => @physical_examination.complete_blood_count == 'yes' ? '✔' : '',
      "cpca" => @physical_examination.complete_blood_count == 'yes' ? '' : @physical_examination.complete_blood_count,
      "uriny" => @physical_examination.urinalysis == 'yes' ? '✔' : '',
      "urina" => @physical_examination.urinalysis == 'yes' ? '' : @physical_examination.urinalysis,
      "fecy" => @physical_examination.fecalysis == 'yes' ? '✔' : '',
      "feca" => @physical_examination.fecalysis == 'yes' ? '' : @physical_examination.fecalysis,
      "chesy" => @physical_examination.chest_xray == 'yes' ? '✔' : '',
      "chesa" => @physical_examination.chest_xray == 'yes' ? '' : @physical_examination.chest_xray,
      "fasty" => @physical_examination.fasting_blood_sugar == 'yes' ? '✔' : '',
      "fasta" => @physical_examination.fasting_blood_sugar == 'yes' ? '' : @physical_examination.fasting_blood_sugar,
      "lipy" => @physical_examination.lipid_profile == 'yes' ? '✔' : '',
      "lipa" => @physical_examination.lipid_profile == 'yes' ? '' : @physical_examination.lipid_profile,
      "bloody" => @physical_examination.blood_uric_acid == 'yes' ? '✔' : '',
      "blooda" => @physical_examination.blood_uric_acid == 'yes' ? '' : @physical_examination.blood_uric_acid,
      "ecgy" => @physical_examination.ecg_12_leads == 'yes' ? '✔' : '',
      "ecga" => @physical_examination.ecg_12_leads == 'yes' ? '' : @physical_examination.ecg_12_leads,
      "drugy" => @physical_examination.drug_test == 'yes' ? '✔' : '',
      "druga" => @physical_examination.drug_test == 'yes' ? '' : @physical_examination.drug_test,
      "sputy" => @physical_examination.sputum_genexpert == 'yes' ? '✔' : '',
      "sputa" => @physical_examination.sputum_genexpert == 'yes' ? '' : @physical_examination.sputum_genexpert,
      "hby" => @physical_examination.hbsag == 'yes' ? '✔' : '',
      "hba" => @physical_examination.hbsag == 'yes' ? '' : @physical_examination.hbsag,
      "others_1" => @physical_examination.others_1,
      "diagnosis" => @physical_examination.diagnosis,
      "plan" => @physical_examination.plan,
      "district_physician" => @physical_examination.district_physician,
      "date" => @physical_examination.date.strftime("%b %d, %Y")
    }

    template.render_to_string(context)
  end
end
