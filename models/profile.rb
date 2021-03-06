require 'carrierwave'
require 'carrierwave/orm/activerecord'

class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
end

class LogoUploader < CarrierWave::Uploader::Base
  storage :file
end

class Profile < ActiveRecord::Base
  has_secure_password
  mount_uploader :profile_picture, AvatarUploader
  mount_uploader :logo, LogoUploader
end
