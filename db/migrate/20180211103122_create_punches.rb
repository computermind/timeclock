class CreatePunches < ActiveRecord::Migration[5.1]
  def change
    create_table :punches do |t|
      t.text :comments
      t.datetime :punch_out

      t.timestamps
    end
  end
end
