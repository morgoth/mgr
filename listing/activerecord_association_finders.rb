student = Student.first
student.exams.find_by_name "IT test"
student.exams.create :name => "Hard test"
student.exams.destroy_all