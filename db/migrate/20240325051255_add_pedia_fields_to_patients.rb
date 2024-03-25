class AddPediaFieldsToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :length, :float
    add_column :patients, :body_circumference, :float
    add_column :patients, :muac, :float
    add_column :patients, :head_circumference, :float
    add_column :patients, :hip, :float
    add_column :patients, :limbs, :float
    add_column :patients, :z_score, :string
  end
end
