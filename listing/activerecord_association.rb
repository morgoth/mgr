class Student < ActiveRecord::Base
  has_many :exams
end

class Exam < ActiveRecord::Base
  belongs_to :student
end