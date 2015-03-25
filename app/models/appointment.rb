class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  def start=(new_time)
    self[:start] = Time.parse(new_time)
  end
  def end=(new_time)
    self[:end] = Time.parse(new_time)
  end

end
