class Cfcreaction < ApplicationRecord
  belongs_to :cfcuser
  belongs_to :cfcpost, optional: true

  # Kinds = %w[ like dislike ].freeze
  # KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta"}.freeze
  validates :kind, acceptance: {
    accept: %w[like dislike ]
    }
    def self.kinds
      %w[ like dislike ]
      end
     

end
