import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

class LocationOnMapWidget extends StatefulWidget {
  final LatLng target;
  final String title;

  LocationOnMapWidget({required this.target,required this.title});

  @override
  _LocationOnMapWidgetState createState() => _LocationOnMapWidgetState();
}

class _LocationOnMapWidgetState extends State<LocationOnMapWidget> {
  CameraPosition? _kGooglePlex;
  String? _mapStyle;
  Set<Marker> markers = Set<Marker>();
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
     _kGooglePlex =  CameraPosition(
      target: widget.target,
      zoom: 14.4746,
    );
    markers.add(Marker(
      markerId:  MarkerId(widget.title),
      infoWindow:  InfoWindow(
        title:widget.title,
      ),
      position: widget.target,
      // icon: BitmapDescriptor.fromBytes(markIcons),
    ));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location On Map",style: poppinsSemiBoldTextStyle(fontSize: 14, context: context),),

          Padding(
            padding: const EdgeInsets.only(top:15),
            child: Container(

              height: size.height*0.3,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),

              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                markers: markers,
                // polylines: polyline,
                zoomControlsEnabled: false,
                // onCameraMoveStarted: onCameraMoveStarted,
                // onCameraIdle: onCameraIdle,
                // onMapCreated: onMapCreated,
                initialCameraPosition: _kGooglePlex!,
              ),


              // child: GoogleMap(
              //   initialCameraPosition: CameraPosition(
              //     target: LatLng(widget.latitude, widget.longitude),
              //     zoom: 16.0,
              //   ),
              //   onMapCreated: (controller) {
              //     setState(() {
              //       _mapController = controller;
              //     });
              //   },
              //   markers: Set<Marker>.of([
              //     Marker(
              //       markerId: MarkerId("location"),
              //       position: LatLng(widget.latitude, widget.longitude),
              //       infoWindow: InfoWindow(title: "Location"),
              //     ),
              //   ]),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
