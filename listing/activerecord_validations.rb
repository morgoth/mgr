class Exam < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :duration, :only_integer => true,
                                       :greater_than => 0
  validate :size_of_question_number, :if => :question_number

  def size_of_question_number
    if question_number > teacher_questions_size
      errors.add(:question_number, :greater_than_total)
    end
  end
end