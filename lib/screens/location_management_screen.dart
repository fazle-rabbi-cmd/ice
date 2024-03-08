import 'package:flutter/material.dart';

class LocationManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            'Manage Locations',
            style: TextStyle(fontSize: 24.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3, // Replace with the actual number of saved locations
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('location_$index'),
            direction: DismissDirection.horizontal,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            onDismissed: (direction) {
              // Implement remove location action
            },
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text('Location ${index + 1}'),
                subtitle: Text(
                    'City, Country'), // Replace with actual location details
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Implement edit location action
                      },
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.drag_handle),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add location action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart'; // Import geocoding package
//
// class LocationManagementScreen extends StatefulWidget {
//   @override
//   _LocationManagementScreenState createState() =>
//       _LocationManagementScreenState();
// }
//
// class _LocationManagementScreenState extends State<LocationManagementScreen> {
//   GoogleMapController? _mapController;
//   Set<Marker> _markers = {};
//   LatLng? _selectedLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Manage Locations',
//           style: TextStyle(fontSize: 24.0),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.close),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(0, 0), // Initial map center
//               zoom: 12, // Initial zoom level
//             ),
//             onMapCreated: (GoogleMapController controller) {
//               _mapController = controller;
//             },
//             onTap: _onMapTap,
//             markers: _markers,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: _selectedLocation != null ? _addLocation : null,
//                 child: Text('Add Location'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onMapTap(LatLng latLng) {
//     setState(() {
//       _selectedLocation = latLng;
//       _markers.clear();
//       _markers.add(
//         Marker(
//           markerId: MarkerId('selected-location'),
//           position: _selectedLocation!,
//           infoWindow: InfoWindow(title: 'Selected Location'),
//         ),
//       );
//     });
//   }
//
//   void _addLocation() async {
//     // Reverse geocoding: convert coordinates to address
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       _selectedLocation!.latitude,
//       _selectedLocation!.longitude,
//     );
//
//     if (placemarks.isNotEmpty) {
//       Placemark placemark = placemarks.first;
//       String address =
//           '${placemark.name}, ${placemark.locality}, ${placemark.country}';
//
//       // Perform action to add the location with address to saved locations
//       // You can replace this with your actual implementation
//       print('Selected location: $_selectedLocation, Address: $address');
//
//       // Clear selected location after adding
//       setState(() {
//         _selectedLocation = null;
//         _markers.clear();
//       });
//     }
//   }
// }
