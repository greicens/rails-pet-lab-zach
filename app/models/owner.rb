class Owner < ActiveRecord::Base

  has_many :pets
  has_secure_password

  # TODO: add association to appointments (through pets)

  validates_associated :pets

  before_save :normalize_phone_number


  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # stretch
  end

end
