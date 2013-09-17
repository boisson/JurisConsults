# Change this omniauth configuration to point to your registered provider
# Since this is a registered application, add the app id and secret here
require 'proteste_auth_id'

APP_ID      = '6e6469e1d695388292c836162be9ef264081ed0683a47b'
APP_SECRET  = '45e1bd946aa5ec60b5ede929b4b003f8110de75bf1f67985cfaaea6773414bf15a7644d874bbc3b8af837d'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :proteste_auth_id, APP_ID, APP_SECRET
end