class Cfcuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cfcposts, through: :cfcreactions
         has_many :cfcreactions
         has_many :cfccomments
         
end
