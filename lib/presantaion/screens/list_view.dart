import 'dart:async';

import 'package:flutter/material.dart';

class ListViewewscreen extends StatefulWidget {
  const ListViewewscreen({super.key});

  @override
  State<ListViewewscreen> createState() => _ListViewewscreenState();
}

class _ListViewewscreenState extends State<ListViewewscreen> {
  final List<Map<String, String>> persons = [
    {
      'image': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
      'name': 'Aria',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/02/10/88/42/360_F_210884264_n0DjI1DXJ1afJlWBIYFQqMf9P28B7U9z.jpg',
      'name': 'Liam',
    },
    {
      'image': 'https://t3.ftcdn.net/jpg/02/39/38/49/360_F_239384912_iAFwDCTmj6z8D3KJvjJNNVnJpZWbCp7W.jpg',
      'name': 'Mia',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/02/47/73/92/360_F_247739246_U7pT9I0kXXjl92GSFDNWKHBvjOGsLBMe.jpg',
      'name': 'Noah',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/01/69/32/12/360_F_169321260_5Vwgqnz92io62ArA9nVhvAGnIvgyS6Xi.jpg',
      'name': 'Sophia',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/03/39/18/49/360_F_339184987_A5C0ux4VLydIT5GMoLkL0FLQbqZVgp9b.jpg',
      'name': 'James',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/01/51/29/20/360_F_151292016_5weX1cMwlg9lb4N0jZZgiTxpCZXYY4rQ.jpg',
      'name': 'Emma',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/01/76/92/04/360_F_176920466_ozzyKPYnH5gqEdqCMuavNXEVJjJgUbyN.jpg',
      'name': 'Oliver',
    },
    {
      'image': 'https://t3.ftcdn.net/jpg/03/10/82/77/360_F_310827749_q3ndQ8EhWQQaxMMNlj1xVGGD8B8AxLkK.jpg',
      'name': 'Ava',
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/03/50/50/22/360_F_350502247_GDK2T1I1loFj9pFphqJyc2WCuFEaYQhe.jpg',
      'name': 'William',
    },
  ];

  String _currentDate = "";
 // Variable to hold the current date
  late Timer _timer;
 // Timer to update the date
  @override
  void initState() {
    super.initState();
    _updateDate(); // Update the date immediately
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateDate(); // Update the date every second
    });
  }

  void _updateDate() {
    setState(() {
      _currentDate = DateTime.now().toLocal().toString(); // Get the current date and time
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Message"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(persons[index]['name']!),
              subtitle: Text(_currentDate), // Display the current date
              leading: CircleAvatar(
                backgroundImage: NetworkImage(persons[index]['image']!), // Use the image from the list
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  print('${persons[index]['name']} button pressed'); // Print the name of the person
                },
              ),
            );
          },
      ),
    );
  }
}