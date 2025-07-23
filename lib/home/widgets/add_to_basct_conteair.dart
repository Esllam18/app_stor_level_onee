import 'package:application_2_leveel_1/home/widgets/widget_botton.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class ViewAddToBasct extends StatefulWidget {
  const ViewAddToBasct({
    super.key,
    required this.basketList,
    required this.itemCounts,
    required this.itemCount,
    required void Function(int index, int newCount) updateItemCount,
  });
  final List<Fruits> basketList;
  final List<int> itemCounts;
  final int itemCount;

  @override
  State<ViewAddToBasct> createState() => _ViewAddToBasctState();
}

class _ViewAddToBasctState extends State<ViewAddToBasct> {
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
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Color(0xff0CA201).withOpacity(0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.basketList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CircleAvatar(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Color(0xffF6F6F6),
                    child: Image.asset(
                      widget.basketList[index].image,
                      width: 29.63,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          VerticalDivider(
            width: 1,
            color: Colors.white,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (context) {
                  return WidgetBottom(
                    basketList: widget.basketList,
                    itemCounts: widget.itemCounts,
                    itemCount: widget.itemCount,
                    updateItemCount: updateItemCount,
                  );
                },
              );
            },
            child: const Text(
              'View Basket',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Badge(
              label: Text(widget.basketList.length.toString()),
              child: Image.asset(
                'assets/images/icons/Vector 1.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
