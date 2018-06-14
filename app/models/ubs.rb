class Ubs < ApplicationRecord
  scope :query, -> (query) { where(query_to_gelocation(query)) if query }

  def self.query_to_gelocation(query)
    geolocation = query.split(',')
    { latitude: geolocation.first, longitude: geolocation.last }
  end
end
