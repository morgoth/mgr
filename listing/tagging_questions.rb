class TeacherQuestion < ActiveRecord::Base
  acts_as_taggable_on :tags
end

question = TeacherQuestion.new
question.tag_list = "IT, webdevelopment"
question.save
question.tag_list
#=> ["IT", "webdevelopment"]
TeacherQuestion.find_tagged_with("IT", :on => :tags)
#=> [#<TeacherQuestion>]