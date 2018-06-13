class Api::V1::UbssController < ApplicationController
  def index
    render json: Ubs.all
  end
end
