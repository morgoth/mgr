class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
end

class TeacherAnswer < ActiveRecord::Base
  has_one :picture, :as => :imageable
end

class TeacherQuestion < ActiveRecord::Base
  has_one :picture, :as => :imageable
end
