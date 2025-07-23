import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatefulWidget {
  final List<Fruits> basketList;
  final List<int> itemCounts;

  const TotalPriceWidget({
    super.key,
    required this.basketList,
    required this.itemCounts,
  });

  @override
  State<TotalPriceWidget> createState() => _TotalPriceWidgetState();
}

class _TotalPriceWidgetState extends State<TotalPriceWidget> {
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (
      int i = 0;
      i < widget.basketList.length && i < widget.itemCounts.length;
      i++
    ) {
      String cleanedPrice = widget.basketList[i].price.replaceAll(
        RegExp(r'[^\d.]'),
        '',
      );
      double? price = double.tryParse(cleanedPrice);
      if (price != null) {
        totalPrice += price * widget.itemCounts[i];
      } else {
        debugPrint(
          'Error: Invalid price format for ${widget.basketList[i].name}: ${widget.basketList[i].price}',
        );
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = calculateTotalPrice();

    return Column(
      mainAxisSize: MainAxisSize.min, // لتقليل المساحة التي تشغلها الـ Column
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffF6F6F6),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.basketList.isEmpty
                  ? 'Total Price: \$0.00'
                  : 'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // widget to navigate to Go to checkout screen
        widget.basketList.isNotEmpty
            ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/checkout');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Go to Checkout',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }
}
