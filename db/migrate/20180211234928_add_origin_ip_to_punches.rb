class AddOriginIpToPunches < ActiveRecord::Migration[5.1]
  def change
    add_column :punches, :origin_ip, :string
  end
end
