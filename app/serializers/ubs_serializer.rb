class UbsSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :phone, :geocode, :scores

  def geocode
    { lat: object.latitude.to_f, long: object.longitude.to_f }
  end

  def scores
    {
      size: object.size,
      adaptation_for_seniors: object.adaptation_for_seniors,
      medical_equipment: object.medical_equipment,
      medicine: object.medicine
    }
  end
end
