import 'package:application_2_leveel_1/home/widgets/cart_page.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.basketList,
    required this.itemCounts,
  });

  final List<Fruits> basketList;
  final List<int> itemCounts;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        children: [
          Image.asset('assets/images/icons/motors.png', width: 24, height: 24),
          const SizedBox(width: 10),
          const Text(
            '61 Hopper street..',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          Image.asset('assets/images/icons/icons.png', width: 24, height: 22),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CartPage(
                        basketList: basketList,
                        itemCounts: itemCounts,
                        itemCount: itemCounts.length,
                      ),
                ),
              );
            },
            child: Image.asset(
              'assets/images/icons/Vector 1.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
