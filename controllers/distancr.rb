get('/distancr') { @title = 'Distancr'; erb :distancr }

post('/distancr') {
  @origin = lat_long(params[:origin])
  @destination = lat_long(params[:destination])
  @distance = get_distance(@origin, @destination)
  erb :distancr
}
