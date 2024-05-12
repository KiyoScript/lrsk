class CreatePhysicians < ActiveRecord::Migration[7.1]
  def change
    create_table :physicians do |t|
      t.string :firstname
      t.string :middle_initial
      t.string :lastname
      t.string :contact_number
      t.string :email_address
      t.integer :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
