def style(name)
  "<link rel='stylesheet' href='css/#{name}.css' />"
end

def script(name)
  "<script src='js/#{name}.js'></script>'"
end

def get_distance(p1, p2)
  Geocoder::Calculations.distance_between(p1, p2)
end

def lat_long(place)
  Geocoder.coordinates(place)
end

def map_image(place, zoom)
  "http://maps.googleapis.com/maps/api/staticmap?center=#{place[0]},#{place[1]}&zoom=#{zoom}&size=400x400&sensor=false"
end