class Landing::BaseController < ApplicationController
  protect_from_forgery with: :exception

  layout "landing"
end
