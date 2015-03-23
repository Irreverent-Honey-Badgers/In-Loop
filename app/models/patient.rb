class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :events
  has_many :doctors, through: :events

  def self.from_omniauth(auth)
    where(provider: auth.provider, pid: auth.uid).first_or_create do |patient|
      patient.email = auth.info.email
      patient.password = Devise.friendly_token[0,20]
      patient.first_name = auth.info.first_name   # assuming the patient model has a name
      patient.last_name = auth.info.last_name   # assuming the patient model has a name
    end
  end

end
