class Api::V1::UbssController < ApplicationController
  def index
    render json: Ubs.all, adapter: :json
  end
end
