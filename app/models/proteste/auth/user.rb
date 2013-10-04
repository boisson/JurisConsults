class Proteste::Auth::User < ActiveRecord::Base
	include ProtesteAuth::User::Methods
	store :info, accessors: [:name, :login, :email, :trigram, :active_directory, :language, :company, :groups, :applications_user_types_users, :blocked?, :access_locked?]
	attr_accessible :name, :login, :email, :trigram, :active_directory, :language, :company, :groups, :blocked?, :access_locked?
  attr_accessible :info, :uid
end
