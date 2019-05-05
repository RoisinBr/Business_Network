require 'carrierwave'
require 'carrierwave/orm/activerecord'

class ImageUploader < CarrierWave::Uploader::Base
    storage :file
end

class MemberOffer < ActiveRecord::Base
    mount_uploader :image, ImageUploader
end
