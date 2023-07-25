class Cfcreaction < ApplicationRecord
  belongs_to :cfcuser
  belongs_to :cfcpost, optional: true

  
   
end
