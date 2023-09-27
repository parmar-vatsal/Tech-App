import 'package:flutter/material.dart';
import 'package:login/Screens/Products/CategorieScreen.dart';

class SearchSuggestion {
  final String title;
  final String categoryKey;

  SearchSuggestion({required this.title, required this.categoryKey});
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<bool> _onBackPressed() async {
    // Show confirmation dialog when the back button is pressed
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Exit the Application?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            content: const Text(
              'Are you sure you want to leave the Tech?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the screen
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Leave the Privacy Policy
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  final List<SearchSuggestion> suggestions = [
    SearchSuggestion(title: "Smartphone", categoryKey: "Mobile"),
    SearchSuggestion(title: "Laptop", categoryKey: "Laptop"),
    SearchSuggestion(title: "Headphones", categoryKey: "HeadPhone"),
    SearchSuggestion(title: "Smartwatch", categoryKey: "Smartwatch"),
    SearchSuggestion(title: "Refridger", categoryKey: "Refridger"),
    SearchSuggestion(title: "Router", categoryKey: "Router"),
    SearchSuggestion(title: "Tvs", categoryKey: "Tvs"),
    SearchSuggestion(title: "Speaker", categoryKey: "Speaker"),
  ];

  List<SearchSuggestion> filteredSuggestions = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    // Filter suggestions based on user input
                    filteredSuggestions = suggestions
                        .where((suggestion) => suggestion.title
                            .toLowerCase()
                            .contains(text.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for category...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSuggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredSuggestions[index].title),
                    onTap: () {
                      _onSuggestionSelected(filteredSuggestions[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSuggestionSelected(SearchSuggestion suggestion) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategorieScreen(categoryKey: suggestion.categoryKey),
      ),
    );
  }
}
