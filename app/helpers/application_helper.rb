module ApplicationHelper
  def map_for_coords(coords)
    tag("div",
      id: "map-canvas",
      data: { lat: coords[0], long: coords[1] }
    )
  end
end
