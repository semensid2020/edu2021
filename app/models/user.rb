class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  # has_and_belongs_to_many :roles,        :join_table => :users_roles  # Когда будет гем rolify
  has_and_belongs_to_many :study_groups, :join_table => :users_study_groups
  has_one_attached :avatar    # Когда будут аватарки


  # def default_role      # Когда будет гем rolify
  #   roles.first.name
  # end

  # def admin?           # Когда будет гем rolify
  #   has_role?(:admin)
  # end


  # def regular_name                # Когда будет гем rolify
  #   first_name = self.first_name.present? ? self.first_name : ''
  #   last_name  = self.last_name.present? ? self.last_name : ''
  #   role_to_russian =
  #     if self.roles.first["name"] == 'admin'
  #       'администратор'
  #     elsif self.roles.first["name"] == 'teacher'
  #       'учитель'
  #     else
  #       'студент'
  #     end
  #
  #   (first_name.length == 0 && last_name.length == 0) ? "#{role_to_russian}" + self.email : "#{role_to_russian}" + " #{first_name} #{last_name}"
  # end


  # def full_name     # ТРЕБУЕТ ДОРАБОТКИ, Т.К. СЕЙЧАС НЕТ ПОЛЯ middle_name
  #   first_name = self.first_name.present? ? self.first_name : ''
  #   last_name  = self.last_name.present? ? self.last_name : ''
  #   middle_name = self.middle_name.present? ? self.middle_name : ''
  #
  #   (first_name.length == 0 && last_name.length == 0) ? self.email : "#{last_name} #{first_name} #{middle_name}"
  # end


    # private
                                    ## Когда будет гем rolify
    # def set_default_role
    #   self.add_role :student if self.roles.blank?
    # end


                                    ## Когда будет добавлено хранение аватарок (active_storage)
    # def set_default_avatar
    #   self.avatar.attach(io: File.open("app/assets/images/avatars/anonim_avatar.png"), filename: "anonim_avatar.png", content_type: "image/png")
    #   # self.save
    # end

                                        ## Нужно актуализировать что там с почтой
    # def send_notification_to_admin
    #   return unless Rails.env.development?
    #   @user = self
    #   MessagesMailer.user_created(@user).deliver
    # end

end
