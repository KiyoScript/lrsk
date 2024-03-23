class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :fullname
      t.date :birthdate
      t.integer :age
      t.integer :gender
      t.json :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
