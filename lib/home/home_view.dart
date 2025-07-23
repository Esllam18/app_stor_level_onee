import 'package:application_2_leveel_1/Favourite/favourite_view.dart';
import 'package:application_2_leveel_1/Profile/profile_view.dart';
import 'package:application_2_leveel_1/home/widgets/add_to_basct_conteair.dart';
import 'package:application_2_leveel_1/home/widgets/baners_view.dart';
import 'package:application_2_leveel_1/home/widgets/categories_view.dart';
import 'package:application_2_leveel_1/home/widgets/custom_app_bar.dart';
import 'package:application_2_leveel_1/home/widgets/fruits_see_all_line.dart';
import 'package:application_2_leveel_1/home/widgets/indector.dart';
import 'package:application_2_leveel_1/home/widgets/proudects_card_list_view.dart';
import 'package:application_2_leveel_1/menu/menu_page.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:application_2_leveel_1/search/search_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // للـ Carousel
  int _selectedIndex = 0; // للـ BottomNavigationBar
  List<Fruits> basketList = [];
  List<int> itemCounts = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void toggleState(Fruits fruit) {
    setState(() {
      if (basketList.contains(fruit)) {
        int index = basketList.indexOf(fruit);
        basketList.remove(fruit);
        itemCounts.removeAt(index);
      } else {
        basketList.add(fruit);
        itemCounts.add(1);
      }
    });
  }

  bool isSelected(Fruits fruit) => basketList.contains(fruit);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(),
      const FavouriteView(),
      SearchView(
        basketList: basketList,
        itemCounts: itemCounts,
        toggleState: toggleState,
      ),
      const ProfileView(),
      const MenuView(),
    ];

    return Scaffold(
      appBar: CustomAppBar(basketList: basketList, itemCounts: itemCounts),

      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          BanersView(
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          const SizedBox(height: 12),
          IndecatorsForBaners(currentIndex: _currentIndex),
          const SizedBox(height: 12),
          CategoriesView(),
          const SizedBox(height: 30),
          FruitsAndSeeAllLine(),
          const SizedBox(height: 32),
          ProudectsCardListView(
            toggleState: toggleState,
            isSelected: isSelected,
          ),
          ViewAddToBasct(
            basketList: basketList,
            itemCounts: itemCounts,
            itemCount: itemCounts.length,
            updateItemCount: (int index, int newCount) {
              setState(() {
                if (index >= 0 && index < itemCounts.length) {
                  itemCounts[index] = newCount;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
