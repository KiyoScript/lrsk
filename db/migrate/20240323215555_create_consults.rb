class CreateConsults < ActiveRecord::Migration[7.1]
  def change
    create_table :consults do |t|
      t.date :date
      t.time :time
      t.text :reason
      t.text :s
      t.string :blood_pressure
      t.integer :heart_rate
      t.text :rr
      t.float :temperature
      t.string :spo_2
      t.float :weight
      t.float :height
      t.float :bmi
      t.text :o
      t.text :a
      t.text :p
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
