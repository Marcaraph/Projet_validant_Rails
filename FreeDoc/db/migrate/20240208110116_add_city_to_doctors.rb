class AddCityToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_reference :doctors, :city, null: false, foreign_key: true
    add_reference :patients, :city, null: false, foreign_key: true
    add_reference :appointments, :city, null: false, foreign_key: true
  end
end
