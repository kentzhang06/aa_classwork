
export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    benches.forEach((bench) => {
      this.createMarkerFromBench(bench);
    });
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