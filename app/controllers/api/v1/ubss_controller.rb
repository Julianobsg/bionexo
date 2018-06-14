class Api::V1::UbssController < ApplicationController
  def index
    render json: { current_page: (params[:page] || 1).to_i, per_page: per_page.to_i, total_entries: Ubs.all.count, entries: entries }, adapter: :json
  end

  private

  def entries
    ActiveModelSerializers::SerializableResource.new(Ubs.page(params[:page]).per(per_page).query(params[:query]))
  end

  def per_page
    params[:per_page] || 10
  end
end
