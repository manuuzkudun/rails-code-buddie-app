class User < ApplicationRecord
  has_many :exercise_submissions
  has_many :exerecises
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :lastseenable, omniauth_providers: [:github]

  def self.find_for_github_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    name = auth.info.name.split(" ")
    user_params[:first_name] = name.first
    user_params[:last_name] = name.last
    user_params.merge! auth.info.slice(:email)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def logged_in?
    self.last_seen < 5.minutes.ago
  end


end
