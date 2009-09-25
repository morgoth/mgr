class TeacherQuestion < ActiveRecord::Base
  def max_points
    if question_type == 'radio_button'
      teacher_answers.map { |answer| answer.points }.compact.max
    else
      teacher_answers.map do |answer|
        answer.points if answer.points > 0
      end.compact.inject { |sum, p| sum += p }
    end
  end
end