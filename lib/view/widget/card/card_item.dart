import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.itemName,
    required this.count,
    required this.onPressedAdd,
    required this.onPressedRemove,
  });
  final String itemName;

  final String count;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: onPressedRemove,
                        icon: const Icon(
                          Icons.remove_circle,
                          size: 35,
                          color: Colors.green,
                        )),
                    Text(
                      count,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColor.titleTextColor),
                    ),
                    IconButton(
                        onPressed: onPressedAdd,
                        icon: const Icon(
                          Icons.add_circle,
                          size: 35,
                          color: Colors.green,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
