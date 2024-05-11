class UpdateConsultColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :consults, :weight
    remove_column :consults, :height
    remove_column :consults, :bmi
    remove_column :consults, :temperature
    remove_column :consults, :spo_2
    remove_column :consults, :blood_pressure
    remove_column :consults, :heart_rate
  end
end
