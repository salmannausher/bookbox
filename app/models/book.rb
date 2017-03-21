class Book < ApplicationRecord
	#Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-7.0.5-Q16'
	 has_attached_file :image, styles: { }
   do_not_validate_attachment_file_type :image
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
