import 'package:application_2_leveel_1/data.dart';
import 'package:application_2_leveel_1/models.dart';
import 'package:flutter/material.dart';

class ProudectsCardListView extends StatelessWidget {
  const ProudectsCardListView({
    super.key,
    required this.toggleState,
    required this.isSelected,
  });
  final Function(Fruits) toggleState;
  final Function(Fruits) isSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(fruits.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 160,
                      width: 147,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
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
                          fruits[index].image,
                          height: 146.92324829101562,
                          width: 119,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        child: GestureDetector(
                          onTap: () => toggleState(fruits[index]),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffF6F6F6),
                            child:
                                isSelected(fruits[index])
                                    ? Image.asset(
                                      'assets/images/icons/trash-2.png',
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.cover,
                                    )
                                    : Image.asset(
                                      'assets/images/icons/Icons add.png',
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.cover,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  fruits[index].name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Color(0xffFFD500)),
                    SizedBox(width: 5),
                    Text(
                      '${fruits[index].rating}  ${fruits[index].retingCount}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  fruits[index].price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
