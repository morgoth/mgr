exam = Exam.first
exam.state
#=> "prepared"
exam.can_finish?
#=> false
exam.start
#=> true
exam.state_events
#=> [:try_finish, :finish]
exam.finish
#=> true
exam.finished?
#=> true