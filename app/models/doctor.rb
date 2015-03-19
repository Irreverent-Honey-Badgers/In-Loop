class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :appointments
  has_many :patients, through: :appointments

  def self.from_omniauth(auth)
    where(provider: auth.provider, did: auth.uid).first_or_create do |doctor|
      doctor.email = auth.info.email
      doctor.password = Devise.friendly_token[0,20]
      doctor.first_name = auth.info.first_name   # assuming the doctor model has a name
      doctor.last_name = auth.info.last_name   # assuming the doctor model has a name
    end
  end

end
