import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class WidgetBottom extends StatefulWidget {
  const WidgetBottom({
    super.key,
    required this.basketList,
    required this.itemCounts,
    required this.itemCount,
    required this.updateItemCount,
  });
  final List<Fruits> basketList;
  final List<int> itemCounts;
  final int itemCount;
  final void Function(int index, int newCount) updateItemCount;

  @override
  State<WidgetBottom> createState() => _WidgetBottomState();
}

class _WidgetBottomState extends State<WidgetBottom> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child:
              widget.basketList.isEmpty
                  ? SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/pngtree-shopping-cart-icon-image_1166717.jpg',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Your basket is empty!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  )
                  : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.basketList.length,
                      itemBuilder: (context, index) {
                        if (widget.itemCounts.length <= index) {
                          widget.itemCounts.add(1);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
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
                                  child: Image.asset(
                                    widget.basketList[index].image,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.itemCounts[index]} Bunch of ${widget.basketList[index].name}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff0A0B0A),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      widget.basketList[index].price,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff0A0B0A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 38,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color(0xffF6F6F6),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          widget.updateItemCount(
                                            index,
                                            widget.itemCounts[index] - 1,
                                          );
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/icons/trash-2.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(widget.itemCounts[index].toString()),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          widget.updateItemCount(
                                            index,
                                            widget.itemCounts[index] + 1,
                                          );
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/icons/Icons add.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
        );
      },
    );
  }
}
