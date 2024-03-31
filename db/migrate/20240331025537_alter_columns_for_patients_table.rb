class AlterColumnsForPatientsTable < ActiveRecord::Migration[7.1]
   remove_column :patients, :details
   add_column :patients, :address_line, :string
   add_column :patients, :contact_number, :string
end
