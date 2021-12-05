class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name
  has_many :checkings
  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  has_and_belongs_to_many :roles,        :join_table => :users_roles
  has_and_belongs_to_many :study_groups, :join_table => :users_study_groups
  has_one_attached :avatar


  def admin_panel
     self.has_role?('teacher') || self.has_role?('admin')
  end

  def admin?
    has_role?(:admin)
  end

  def teacher?
    has_role?(:teacher)
  end

    private

    def set_default_role
      self.add_role :student if self.roles.blank?
    end

    def set_default_avatar
      self.avatar.attach(io: File.open("app/assets/images/avatars/anonim_avatar.png"), filename: "anonim_avatar.png", content_type: "image/png")
    end

end
