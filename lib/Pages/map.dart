import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
/*
Bildet die No Fly Map Page
*/

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("No Fly Zone Map"),
      body: Center(
        child: Column(
          children: [
            Flexible(
                child: FlutterMap(
              options: MapOptions(center: LatLng(51.77501, 9.38155), zoom: 8),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: LatLng(51.77501, 9.38155), //Zeigt aktuell Höxter
                        builder: (ctx) => const Icon(Icons.pin_drop))
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
