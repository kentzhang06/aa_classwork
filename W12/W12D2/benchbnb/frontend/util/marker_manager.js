
export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    let benchObj = {};

    benches.forEach((bench) => {
      this.createMarkerFromBench(bench);
      benchObj[bench.id] = bench;
    });

    Object.keys(this.markers).forEach((id) => {
      if (!benchObj[id]) {
        this.removeMarker(this.markers[id]);
        delete this.markers[id];
      }
    })
    
  }

  removeMarker(marker) {
    marker.setMap(null);
  }

  createMarkerFromBench(bench) {
    if (!this.markers[bench.id]) {
      const marker = new google.maps.Marker({
        position: {lat: bench.lat, lng: bench.lng},
        title: bench.description
      });
      marker.setMap(this.map);
      this.markers[bench.id] = marker;
    }
  }
}