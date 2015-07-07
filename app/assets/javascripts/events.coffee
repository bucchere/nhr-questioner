ready = ->
  mapCanvas = document.getElementById('map-canvas')
  data = mapCanvas.dataset
  coords = new (google.maps.LatLng)(data.lat, data.long)
  mapOptions = 
    center: coords
    zoom: 16
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  marker = new (google.maps.Marker)(
    position: coords
    map: map)
  return

$(document).ready(ready)
$(document).on('page:load', ready)