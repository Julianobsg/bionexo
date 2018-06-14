class Api::V1::UbssController < ApplicationController
  def index
    render json: { total_entries: Ubs.all.count, entries: ActiveModelSerializers::SerializableResource.new(Ubs.all) }, adapter: :json
  end
end
