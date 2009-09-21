class Picture < ActiveRecord::Base
  has_attached_file :picture,
    :styles => { :original => '250x250>',
                 :small => '50x50>' },
    :url => "/images/:attachment/:id/:style_:basename.:extension"

  validates_attachment_size :picture, :less_than => 100.kilobytes
  validates_attachment_content_type :picture,
    :content_type => ['image/png', 'image/gif', 'image/jpeg']
end