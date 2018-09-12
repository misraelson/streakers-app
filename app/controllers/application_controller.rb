class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  include DeviseWhitelist
  acts_as_token_authentication_handler_for User, fallback: :none
end
