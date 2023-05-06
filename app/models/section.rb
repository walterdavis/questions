class Section < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank

  scope :persisted, -> { where.not(id: nil) }
end
