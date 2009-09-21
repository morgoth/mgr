class Student < User
  acts_as_taggable_on :groups
end

class Teacher < User
  acts_as_tagger
end

student = Student.first
teacher = Teacher.first
teacher.tag student, :with => "aut", :on => :groups
student.groups_from teacher
#=> ["aut"]