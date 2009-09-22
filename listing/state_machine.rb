class Exam < ActiveRecord::Base
  state_machine do
    event :prepare do
      transition nil => :prepared
    end

    event :start do
      transition :prepared => :started, :if => :time_to_start?
    end

    event :try_finish do
      transition :started => :finished, :if => :time_to_finish?
    end

    event :finish do
      transition any => :finished
    end

    after_transition nil => :prepared, :do => :set_teacher_questions
    before_transition :prepared => :started, :do => :set_started_at
  end
end