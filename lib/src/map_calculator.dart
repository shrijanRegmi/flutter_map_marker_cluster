import 'dart:math';

import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MapCalculator {
  final MapCamera mapCamera;

  MapCalculator(this.mapCamera);

  Point<num> getPixelFromPoint(LatLng point) {
    final pos = mapCamera.project(point);
    return pos * mapCamera.getZoomScale(mapCamera.zoom, mapCamera.zoom) -
        mapCamera.pixelOrigin.toDoublePoint();
  }

  Point<double> getPixelFromPointV2(LatLng point) {
    final pxPoint = mapCamera.project(point);
    return pxPoint.subtract(mapCamera.pixelOrigin);
  }

  Point project(LatLng latLng, {double? zoom}) =>
      mapCamera.project(latLng, zoom);

  LatLng unproject(Point point, {double? zoom}) =>
      mapCamera.unproject(point, zoom);
}
