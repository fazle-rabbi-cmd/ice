import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Locations'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for a location:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            SearchField(), // Widget for search field
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Enter location name or postal code',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Handle search button press
            String query = _searchController.text;
            // Perform search action with the entered query
            // You can call a method to fetch weather information for the entered location
          },
        ),
      ),
      onChanged: (value) {
        // Handle text change if needed
      },
      onSubmitted: (value) {
        // Handle search when user submits the text field
        // Perform search action with the entered value
        // You can call a method to fetch weather information for the entered location
      },
    );
  }
}
