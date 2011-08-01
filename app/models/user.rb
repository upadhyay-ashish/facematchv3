class User < ActiveRecord::Base
   has_attached_file :avatar,
                      :path => ":rails_root/public/pics/:attachment/:image_file_name",
                      :url => "/pics/:attachment/:image_file_name"
   validates :name, :presence => true
   validates :name, :length => { :maximum => 50 }
   validates :email, :presence => true
   validates :email, :length => { :maximum => 50 }
   validates :email, :uniqueness => true
   validates :email, :format => {:with => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/}
   validates_attachment_presence :avatar, :message => "=> Please upload the avatar file"
   validates_attachment_size :avatar, :less_than => 2.megabytes, :message => "should be less than 2MB"
   validates_attachment_content_type :avatar, :content_type => ["image/gif","image/jpg","image/jpeg","image/png"], :message => 'invalid format'

   def self.selected_users
    User.all.shuffle!.first(4)
   end

   def self.pic_user(users)
     users.shuffle.first
   end

   def self.first_user(user)
    user.first
   end

   def image_file_name
    "user_#{self.id + (123456789)}#{File.extname(self.avatar_file_name).downcase}"
   end

end
