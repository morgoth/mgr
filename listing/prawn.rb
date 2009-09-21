pdf.text "Wyniki", :size => 20, :style => :bold
students = @exams.map do |exam|
  [ exam.student_login,
    exam.sum_points,
    exam.state ]
end
pdf.move_down(20)
pdf.table students, :border_style => :grid,
                    :headers => ["Login", "Wynik", "Stan"]