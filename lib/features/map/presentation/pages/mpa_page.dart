import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key,required this.markers}) : super(key: key);
  final Set<Marker> markers;

  @override
  State<MapPage> createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {

  String? _mapStyle;
  GoogleMapController? myMapController;

  MapCreatedCallback? onMapCreated(GoogleMapController controller) {
    myMapController = controller;
    myMapController!.setMapStyle(_mapStyle);
    return null;
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("fdkjnvkjdfnjkvndfvsdv");
    print(widget.markers.length);
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: widget.markers,
      zoomControlsEnabled: false,
      onMapCreated: onMapCreated,
      initialCameraPosition: CameraPosition(
        target: widget.markers.isNotEmpty ? widget.markers.first.position : LatLng(36.1996558,  43.990226),
        zoom: 11.4746,
      ),
    );
  }
}

// class _MapPageState extends State<MapPage> {
//   final CameraPosition _kGooglePlex = const CameraPosition(
//     target: LatLng(36.20274909099813, 44.00113213522896),
//     zoom: 1.4746,
//   );
//   String? _mapStyle;
//   GoogleMapController? myMapController;
//   MapCreatedCallback? onMapCreated(GoogleMapController controller) {
//     myMapController = controller;
//     myMapController!.setMapStyle(_mapStyle);
//     return null;
//   }
//   @override
//   void initState() {
//     super.initState();
//     rootBundle.loadString('assets/map_style.txt').then((string) {
//       _mapStyle = string;
//     });
//   }
//
//
//     @override
//   Widget build(BuildContext context) {
//
//     return  Center(
//       child: Container(
//         width: 500,
//         height: 500,
//         child: GoogleMap(
//           myLocationEnabled: true,
//           myLocationButtonEnabled: true,
//           markers: widget.markers,
//
//           // polylines: polyline,
//           zoomControlsEnabled: false,
//           // onCameraMoveStarted: onCameraMoveStarted,
//           // onCameraIdle: onCameraIdle,
//           onMapCreated: onMapCreated,
//           initialCameraPosition: _kGooglePlex,
//         ),
//       ),
//     );
//   }
// }
