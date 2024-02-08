class AddSpecialtyRefToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_reference :doctors, :specialty, null: false, foreign_key: true
  end
end
