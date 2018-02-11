class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :government_entity
      t.string :position
      t.string :employee_phone
      t.integer :employee_id_number
      t.string :supervisor_name
      t.string :supervisor_phone
      t.string :human_resource_manager
      t.string :human_resource_phone
      t.string :creator_name
      t.boolean :status, :boolean, default: true

      t.timestamps
    end
  end
end
