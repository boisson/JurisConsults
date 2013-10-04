# Change this omniauth configuration to point to your registered provider
# Since this is a registered application, add the app id and secret here
require 'proteste_auth_id'

APP_ID      = '69248873499326507a51282d58b4a93c6e0a9825ac7c1d'
APP_SECRET  = '2e8c4b7d0eefc9366959dcae3b88f9bac24547aacdbdd330f173a4b1912004d1b1a9fce42c767e9c7debac'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :proteste_auth_id, APP_ID, APP_SECRET
end