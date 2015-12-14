require 'omniauth-adstage/version'
require 'omniauth/strategies/adstage'

# Ensure OAuth2::Response supports parsing HAL.
require 'oauth2/response'
::OAuth2::Response.register_parser(:hal_json, ['application/hal+json']) do |body|
  MultiJson.load(body) rescue body
end
