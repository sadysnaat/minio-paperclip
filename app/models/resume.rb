class Resume < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :thumb => ["320x320>", :png], :large => ["1500x1500>", :png] }

  validates_attachment_content_type :attachment, 
    content_type: ['application/pdf'],
    message: "Only pdfs allowed"  

  validates :attachment, attachment_presence: true 
end
