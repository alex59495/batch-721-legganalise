class Request < ApplicationRecord
  belongs_to :user
  has_many :lab_analysis
  has_many :samples, through: :lab_analysis

  accepts_nested_attributes_for :lab_analysis

  validates :sample_quantity, :project_name, :project_summary, presence: true
end
