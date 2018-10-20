require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'architect.shima'
        config.asset_host = 'https://s3.amazonaws.com/architect.shima'
    when 'production'
        config.fog_directory  = 'architect.shima'
        config.asset_host = 'https://s3.amazonaws.com/architect.shima'
    end
end
