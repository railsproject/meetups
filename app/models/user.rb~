class User < ActiveRecord::Base
 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 validates :name, :email, :password, :presence => true
 validates :password, :length => { :minimum => 6 }
 validates :email, :uniqueness => true



has_secure_password

end
