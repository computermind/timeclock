class AddEmployeeRefToPunches < ActiveRecord::Migration[5.1]
  def change
    add_reference :punches, :employee, foreign_key: true
  end
end
