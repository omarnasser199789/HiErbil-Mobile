import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';

class LocationOnMapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  LocationOnMapWidget({required this.latitude, required this.longitude});

  @override
  _LocationOnMapWidgetState createState() => _LocationOnMapWidgetState();
}

class _LocationOnMapWidgetState extends State<LocationOnMapWidget> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    //<key>API_KEY</key>
    //     <string>AIzaSyBfU3hOJx157fpINYM1nC-X_fg1Qc_3o1M</string>
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location On Map",style: poppinsSemiBoldTextStyle(fontSize: 14, context: context),),

          Padding(
            padding: const EdgeInsets.only(top:15),
            child: Container(

              height: 200.0,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
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
