class Question < ApplicationRecord
  belongs_to :section

  scope :persisted, -> { where.not(id: nil) }
end
