module Api::V1
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken

      # before_action :authenticate_v1_user!
  end
end
