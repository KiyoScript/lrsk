class RemoveFullnameToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :firstname, :string
    add_column :patients, :middle_initial, :string
    add_column :patients, :lastname, :string

    remove_column :patients, :fullname
  end
end
