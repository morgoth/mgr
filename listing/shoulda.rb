class ExamTest < ActiveSupport::TestCas
  context "Exam state" do
    setup { @exam = Factory(:exam) }

    should "be started when transist from prepared" do
      assert_equal 'prepared', @exam.state
      assert_nil @exam.started_at
      @exam.start
      assert_equal 'started', @exam.state
      assert_not_nil @exam.started_at
    end
  end
end