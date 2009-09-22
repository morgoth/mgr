- semantic_form_for @exam do |f|
  = f.input :name
  = f.input :question_number, :required => false
  = f.input :start_date, :start_year => Time.now.year
  = f.input :duration, :hint => "Leave empty if none"
  = f.input :questions, :collection => @user.questions
  - f.buttons do
    = f.commit_button