class TeacherExam < ActiveRecord::Base
  has_many :exams

  before_destroy :destroyable?

  def destroyable?
    exams.empty?
  end
end
