class Proteste::Auth::User < ActiveRecord::Base
	include ProtesteAuth::User::Methods
  attr_accessible :info, :uid
end
