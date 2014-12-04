GeoMap = React.createClass
  displayName:"GeoMap"

  getDefaultProps:->
    width: 300
    height: 200
    mapId: "#{Math.rand()}id"

  render: ->
    `<div width={this.props.width} height={this.props.height} ref='mapPlaceholder'/>`

  componentDidMount:->
    # @setUpMap()
    $.getJSON "http://nominatim.openstreetmap.org/search/#{@props.query}?format=json", (result)=>
      alert("got result")

      location = [result.lng,result.lat]
      L.marker(location).addTo(@map)


  setUpMap:->
    @map = L.map(@refs.mapPlaceholder).setView([51.505, -0.09], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(@map)

window.GeoMap = GeoMap
