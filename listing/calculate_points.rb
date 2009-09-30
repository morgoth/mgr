class Answer < ActiveRecord::Base
  before_update :calculate_points

  def calculate_points
    case question.question_type
    when "check_box", "radio_button"
      self.points = value == "true" ? teacher_answer.points : 0
    when "text_field"
      if value.empty?
        self.points = 0
      else
        self.points = levenshtein_match? ? teacher_answer.points : 0
      end
    end
  end
end
