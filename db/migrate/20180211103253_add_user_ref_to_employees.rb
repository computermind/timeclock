class AddUserRefToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :user, foreign_key: true
  end
end
