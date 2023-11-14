import 'package:flutter/material.dart';

import '../../core/constant/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.appBarTitle,
      this.iconOnPressed,
      this.searchOnPress,
      this.onChangedSearch,
      required this.searchController,
      this.validator});
  final String appBarTitle;
  final void Function()? iconOnPressed;
  final void Function()? searchOnPress;
  final void Function(String)? onChangedSearch;
  final TextEditingController searchController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 90,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            validator: validator,
            onChanged: onChangedSearch,
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: searchOnPress,
                ),
                hintText: appBarTitle,
                hintStyle: const TextStyle(
                  color: AppColor.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                )),
          )),
          const SizedBox(
            width: 7,
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: iconOnPressed,
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 28, 27, 27),
                )),
          ),
        ],
      ),
    );
  }
}
