class Questionnaire < ApplicationRecord
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, reject_if: :all_blank
end
