class UpdatePatientColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :weight, :float
    add_column :patients, :height, :float
    add_column :patients, :bmi, :float
    add_column :patients, :temperature, :float
    add_column :patients, :blood_pressure, :string
    add_column :patients, :spo_2, :string
    add_column :patients, :heart_rate, :integer
  end
end
