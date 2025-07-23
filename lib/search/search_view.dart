import 'package:application_2_leveel_1/data.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final List<Fruits> basketList;
  final List<int> itemCounts;
  final Function(Fruits) toggleState;

  const SearchView({
    super.key,
    required this.basketList,
    required this.itemCounts,
    required this.toggleState,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchQuery = '';

  bool isSelected(Fruits fruit) => widget.basketList.contains(fruit);

  List<Fruits> getFilteredFruits() {
    if (searchQuery.isEmpty) {
      return fruits;
    }
    return fruits
        .where(
          (fruit) =>
              fruit.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Fruits')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for fruits...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: getFilteredFruits().length,
                itemBuilder: (context, index) {
                  final fruit = getFilteredFruits()[index];
                  return ListTile(
                    leading: Image.asset(
                      fruit.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(fruit.name),
                    subtitle: Text(fruit.price),
                    trailing: IconButton(
                      icon:
                          isSelected(fruit)
                              ? const Icon(Icons.remove_circle)
                              : const Icon(Icons.add_circle),
                      onPressed: () => widget.toggleState(fruit),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
