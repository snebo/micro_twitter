class User < ApplicationRecord
  validates :full_name, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, class_name:"Post", :foreign_key=>:user_id
end
