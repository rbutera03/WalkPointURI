// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong2;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' show min, max;

class CustomMapWidget extends StatefulWidget {
  const CustomMapWidget({
    super.key,
    this.width,
    this.height,
    this.startLat,
    this.startLng,
    this.endLat,
    this.endLng,
  });

  final double? width;
  final double? height;
  final double? startLat;
  final double? startLng;
  final double? endLat;
  final double? endLng;

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  final MapController mapController = MapController();
  List<latlong2.LatLng> routePoints = [];
  latlong2.LatLng? startPoint;
  latlong2.LatLng? endPoint;
  latlong2.LatLng? userLocation;
  bool isLoading = false;
  String? routeInfo;
  bool isParameterized = false;

  final String mapboxToken =
      'pk.eyJ1Ijoicmpnb2xkZW4iLCJhIjoiY20zbWZ2NDNqMGd6dTJrcTg4N3V2amc4biJ9.rV-f3xTTqgl-RDo9eNe4rQ';

  @override
  void initState() {
    super.initState();
    _initializeLocation();
    if (widget.startLat != null && widget.startLng != null) {
      isParameterized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          startPoint = latlong2.LatLng(widget.startLat!, widget.startLng!);
          if (widget.endLat != null && widget.endLng != null) {
            endPoint = latlong2.LatLng(widget.endLat!, widget.endLng!);
            getRoute();
          }
          mapController.move(startPoint!, 15.0);
        });
      });
    }
  }

  Future<void> _initializeLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location services are disabled. Please enable them.'),
        ),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permissions are denied'),
          ),
        );
        return;
      }
    }

    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (mounted) {
        setState(() {
          userLocation = latlong2.LatLng(position.latitude, position.longitude);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Location updated: ${position.latitude}, ${position.longitude}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error getting location: $e'),
          ),
        );
      }
    }
  }

  Future<void> getRoute() async {
    if (startPoint == null || endPoint == null) return;

    setState(() {
      isLoading = true;
      routeInfo = null;
    });

    try {
      final response = await http
          .get(Uri.parse('https://api.mapbox.com/directions/v5/mapbox/walking/'
              '${startPoint!.longitude},${startPoint!.latitude};'
              '${endPoint!.longitude},${endPoint!.latitude}'
              '?geometries=geojson&access_token=$mapboxToken'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['routes'] != null && data['routes'].isNotEmpty) {
          final route = data['routes'][0];
          final geometry = route['geometry'];
          final coordinates = geometry['coordinates'] as List;

          final distance = (route['distance'] as num) / 1609.344;
          final duration = (route['duration'] as num) / 60;

          setState(() {
            routePoints = coordinates
                .map((point) =>
                    latlong2.LatLng(point[1] as double, point[0] as double))
                .toList();

            routePoints.insert(0, startPoint!);
            routePoints.add(endPoint!);

            routeInfo =
                '${distance.toStringAsFixed(2)} miles • ${duration.toStringAsFixed(1)} mins';
          });

          if (routePoints.isNotEmpty) {
            double minLat = routePoints.map((p) => p.latitude).reduce(min);
            double maxLat = routePoints.map((p) => p.latitude).reduce(max);
            double minLng = routePoints.map((p) => p.longitude).reduce(min);
            double maxLng = routePoints.map((p) => p.longitude).reduce(max);

            mapController.fitCamera(
              CameraFit.bounds(
                bounds: LatLngBounds(
                  latlong2.LatLng(minLat, minLng),
                  latlong2.LatLng(maxLat, maxLng),
                ),
                padding: const EdgeInsets.all(50),
              ),
            );
          }
        }
      }
    } catch (e) {
      setState(() {
        routeInfo = 'Error: Unable to calculate route';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _handleTap(TapPosition tapPosition, latlong2.LatLng point) {
    if (!isParameterized) {
      setState(() {
        if (startPoint == null) {
          startPoint = point;
          routePoints = [];
          routeInfo = null;
        } else if (endPoint == null) {
          endPoint = point;
          getRoute();
        } else {
          startPoint = point;
          endPoint = null;
          routePoints = [];
          routeInfo = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 400,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const latlong2.LatLng(41.4860, -71.5300),
              initialZoom: 15.0,
              onTap: _handleTap,
              minZoom: 3,
              maxZoom: 18,
              keepAlive: true,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.flutterflow.app',
              ),
              if (routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      strokeWidth: 6.0,
                      color: const Color.fromARGB(255, 47, 74, 163),
                    ),
                    Polyline(
                      points: routePoints,
                      strokeWidth: 3.0,
                      color: const Color.fromARGB(255, 113, 140, 199),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  if (userLocation != null)
                    Marker(
                      point: userLocation!,
                      width: 40.0,
                      height: 40.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 27, 58, 196)
                              .withOpacity(0.5),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  if (startPoint != null)
                    Marker(
                      point: startPoint!,
                      width: 20.0,
                      height: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  if (endPoint != null)
                    Marker(
                      point: endPoint!,
                      width: 20.0,
                      height: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 13, 71, 168),
                              width: 2),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('Start Point',
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text('End Point',
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isParameterized)
                          Text(
                            startPoint == null
                                ? 'Tap to set start point'
                                : endPoint == null
                                    ? 'Tap to set end point'
                                    : 'Tap anywhere to reset',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        if (routeInfo != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.directions_walk,
                                  size: 14), // Add walking icon
                              const SizedBox(width: 4), // Add some spacing
                              Text(
                                routeInfo!,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              onPressed: () => mapController.move(
                  const latlong2.LatLng(41.4860, -71.5300), 15.0),
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
