class Cfcpost < ApplicationRecord
  belongs_to :cfcuser
  has_many :cfcreactions, dependent: :destroy
  has_many :cfcusers, through: :cfcreactions
  has_many :cfccomments, dependent: :destroy
  
  Kinds = %w[ like dislike ].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze
  
end
