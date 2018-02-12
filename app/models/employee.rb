class Employee < ApplicationRecord
    
  has_many :punches, -> { order "created_at" }
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'


  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :government_entity, presence: true
  validates :position, presence: true
  validates :employee_id_number, presence: true, length: {maximum: 10}, uniqueness: true
  validates :supervisor_name, presence: true
  validates :human_resource_manager, presence: true
  validates :human_resource_phone, presence: true
  validates :creator_name, presence: true


  def deactivate_status
    self.status = false
  end

  def current_punch_in
    self.punches.where(punch_out: nil).last
  end

  def currently_punched_in?
    current_punch_in
  end

  def current_punch_type
    if self.punches.any?
      self.current_punch_in ? "In" : "Out"
    end
  end       

  def total_time_on_job
    total = 0
    self.punches.each do |punch|

      if punch.punch_out
        punch_in_time = punch.created_at
        punch_out_time = punch.punch_out
        total_time = punch_out_time - punch_in_time
        total += total_time
      end
    end

    total
  end
    
end
