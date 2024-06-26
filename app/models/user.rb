class User < ApplicationRecord
  validates :full_name, presence:true, uniqueness:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, class_name:"Post", :foreign_key=>:user_id
  has_many :comments, class_name:"Comment", :foreign_key=>:user_id
end
