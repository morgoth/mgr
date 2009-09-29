class Question < ActiveRecord::Base
  def manage_exam_and_answers
    set_student_answers unless exam.try_finish
  end

  def set_student_answers
    case @student_answers.keys.first
    when "radio_button", "check_box"
      answers.each do |answer|
        if @student_answers.values.flatten.include?(answer.id.to_s)
          answer.update_attributes(:value => 'true')
        else
          answer.update_attributes(:value => 'false')
        end
      end
    when "text_field"
      answers.first.update_attributes(:value => @student_answers.values.first)
    end
  end
end
