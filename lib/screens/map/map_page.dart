import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../widgets/stylish_app_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kAppWorksSchoolPlex = CameraPosition(
    target: LatLng(25.0384847, 121.5297953),
    zoom: 15,
  );
  static const CameraPosition _k101Plex = CameraPosition(
    target: LatLng(25.03368, 121.5623082),
    zoom: 15,
  );
  static const CameraPosition _kTaichungEslitePlex = CameraPosition(
    target: LatLng(24.1512071, 120.6613193),
    zoom: 15,
  );

  Map<String, CameraPosition> cameraPositionMap = {};
  Map<MarkerId, Marker> markerMap = {};

  @override
  void initState() {
    markerMap[MarkerId('台北Appworks旗艦店')] = Marker(
      markerId: MarkerId('台北Appworks旗艦店'),
      position: _kAppWorksSchoolPlex.target,
      infoWindow: InfoWindow(
        title: '台北Appworks旗艦店',
        snippet: '工程師大本營',
      ),
    );
    markerMap[MarkerId('台北101店')] = Marker(
      markerId: MarkerId('台北101店'),
      position: _k101Plex.target,
      infoWindow: InfoWindow(
        title: '台北101店',
        snippet: '工程師酒醉地',
      ),
    );
    markerMap[MarkerId('台中誠品店')] = Marker(
      markerId: MarkerId('台中誠品店'),
      position: _kTaichungEslitePlex.target,
      infoWindow: InfoWindow(
        title: '台中誠品店',
        snippet: '外派工程師的家',
      ),
    );

    cameraPositionMap['台北Appworks旗艦店'] = _kAppWorksSchoolPlex;
    cameraPositionMap['台北101店'] = _k101Plex;
    cameraPositionMap['台中誠品店'] = _kTaichungEslitePlex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StylishAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: ["台北Appworks旗艦店", "台北101店", "台中誠品店"]
                          .map((text) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: GestureDetector(
                                  onTap: () {
                                    var camera = cameraPositionMap[text];
                                    if (camera != null) {
                                      _goNextCamera.call(camera);
                                    }
                                  },
                                  child: Text(text),
                                ),
                              ))
                          .toList(),
                    );
                  },
                  itemCount: 1,
                ),
              ),
              Expanded(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kAppWorksSchoolPlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.of(markerMap.values),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _goNextCamera(CameraPosition camera) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(camera));
  }
}
