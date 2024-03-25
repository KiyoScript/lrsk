class CreatePhysicalExaminations < ActiveRecord::Migration[7.1]
  def change
    create_table :physical_examinations do |t|
      t.boolean :right_eye
      t.boolean :left_eye
      t.boolean :both_eyes
      t.string :heent
      t.string :neck
      t.string :chest_lungs
      t.string :heart
      t.string :breast
      t.string :abdomen
      t.string :gut
      t.string :extremities
      t.string :musculoskeletal
      t.string :neurological
      t.string :skin
      t.text :others
      t.string :complete_blood_count,
      t.string :urinalysis,
      t.string :fecalysis,
      t.string :chest_xray,
      t.string :fasting_blood_sugar,
      t.string :lipid_profile,
      t.string :blood_uric_acid,
      t.string :ecg_12_leads,
      t.string :drug_test,
      t.string :sputum_genexpert,
      t.string :hbsag,
      t.text :others_1
      t.text :diagnosis
      t.text :plan
      t.string :district_physician
      t.date :date
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
