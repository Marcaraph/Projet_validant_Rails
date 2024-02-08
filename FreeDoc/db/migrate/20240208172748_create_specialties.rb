class CreateSpecialties < ActiveRecord::Migration[7.1]
  def change
    create_table :specialties do |t|
      t.string :specialty_name, null: false

      t.timestamps
    end
  end
end
