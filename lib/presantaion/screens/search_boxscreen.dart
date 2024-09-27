import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBoxScreen extends StatefulWidget {
  @override
  State<SearchBoxScreen> createState() => _SearchBoxScreenState();
}

class _SearchBoxScreenState extends State<SearchBoxScreen> {
  final List<String> _fruitItem = [
    'Banana - কলা',
    'Apple - আপেল',
    'Orange - কমলা',
    'Mango - আম',
    'Grapes - আঙুর',
    'Pineapple - আনারস',
    'Strawberry - স্ট্রবেরি',
    'Blueberry - ব্লুবেরি',
    'Raspberry - রাস্পবেরি',
    'Kiwi - কিউই',
    'Peach - পিচ',
    'Watermelon - তরমুজ',
    'Papaya - পেঁপে',
    'Cherry - চেরি',
    'Plum - বরই',
    '„ ডালিম',
    ' নাশপাতি',
    ' নারকেল',
    ' লেবু',
    ' পাতিলেবু'
  ];

  List<String> _filteredItems = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState(); // This line is correct
    _filteredItems = List.from(_fruitItem); // Initialize with all items
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _fruitItem
          .where((item) =>
              item.toLowerCase().contains(query.toLowerCase()) ||
              item.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar'),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: _filterItems, // Call the correct function
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length, // Use filtered items
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredItems[index]), // Display filtered items
          );
        },
      ),
    );
  }
}
