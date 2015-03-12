class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :locations
  has_many :doctors, through: :locations

  def self.from_omniauth(auth)
    where(provider: auth.provider, pid: auth.uid).first_or_create do |patient|
      patient.email = auth.info.email
      patient.password = Devise.friendly_token[0,20]
      patient.first_name = auth.info.first_name   # assuming the patient model has a name
      patient.last_name = auth.info.last_name   # assuming the patient model has a name
    end
  end

end
