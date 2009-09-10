class Exam < ActiveRecord::Base
  before_update :set_started_at

  def set_started_at
    self.started_at = Time.now
  end
end