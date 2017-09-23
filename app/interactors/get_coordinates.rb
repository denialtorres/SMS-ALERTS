class GetCoordinates
  include Interactor

  def call
    context.latitude = get_coordinates["lat"]
    context.longitude = get_coordinates["lng"]
  end
  
  private
  
  def get_coordinates
     Geocoder.search(context.address).first.geometry["location"]
  end
end
