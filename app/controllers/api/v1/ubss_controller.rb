class Api::V1::UbssController < ApplicationController
  def index
    render json: { total_entries: Ubs.all.count, entries: entries }, adapter: :json
  end

  private

  def entries
    ActiveModelSerializers::SerializableResource.new(Ubs.page(params[:page]).per(per_page))
  end

  def per_page
    params[:per_page] || 10
  end
end
