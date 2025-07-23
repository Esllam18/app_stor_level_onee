import 'package:application_2_leveel_1/home/widgets/total_prise.dart';
import 'package:application_2_leveel_1/home/widgets/widget_botton.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Fruits> basketList;
  final List<int> itemCounts;
  final int itemCount;
  // Constructor to initialize the itemCount

  // Constructor to initialize the basketList and itemCounts

  const CartPage({
    super.key,
    required this.basketList,
    required this.itemCounts,
    required this.itemCount,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateItemCount(int index, int newCount) {
    setState(() {
      if (newCount > 0) {
        widget.itemCounts[index] = newCount;
      } else {
        widget.basketList.removeAt(index);
        widget.itemCounts.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'Cart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/ordersIcon.png',
                  width: 16,
                  height: 17.62,
                ),
                Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // soive the renderFlex overflow error by using Expanded widget
              WidgetBottom(
                basketList: widget.basketList,
                itemCounts: widget.itemCounts,
                itemCount: widget.itemCount,
                updateItemCount: updateItemCount,
              ),
              TotalPriceWidget(
                basketList: widget.basketList,
                itemCounts: widget.itemCounts,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
}
