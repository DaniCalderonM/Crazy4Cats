class Cfccomment < ApplicationRecord
  belongs_to :cfcuser, optional: true
  belongs_to :cfcpost
end
