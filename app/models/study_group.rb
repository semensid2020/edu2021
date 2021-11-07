class StudyGroup < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_study_groups
  belongs_to :predmet
end
