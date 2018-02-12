class Punch < ApplicationRecord
   # attr_accessor :origin_ip

    
  belongs_to :employee
  

  def time_on_punch

    if self.punch_out.present?

      punch_in_time = self.created_at
      punch_out_time = self.punch_out

      total_time = punch_out_time - punch_in_time

      seconds = total_time % 60
      minutes = (total_time / 60) % 60
      hours = total_time / (60 * 60)

      format("%04d:%02d:%02d", hours, minutes, seconds)
    end
  end
end
