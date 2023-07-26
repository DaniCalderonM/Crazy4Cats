class Cfcreaction < ApplicationRecord
  belongs_to :cfcuser
  belongs_to :cfcpost, optional: true


  validates :kind, acceptance: {
    accept: %w[like dislike ]
    }
    def self.kinds
      %w[ like dislike ]
      end
     

end
