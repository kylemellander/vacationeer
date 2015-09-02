class Activity < ActiveRecord::Base
  has_and_belongs_to_many(:cities)
  validates(:name, :group, presence: true)
end
