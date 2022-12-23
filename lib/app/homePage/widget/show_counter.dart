import 'package:badges/badges.dart';
import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShowCounter extends GetView<HomePageController> {
  bool showBadge = true;
  String title;
  ShowCounter({
    Key? key,
    required this.title,
    required this.showBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      toAnimate: false,
      ignorePointer: true,
      alignment: Alignment.center,
      badgeColor: Colors.amber,
      // padding: const EdgeInsets.all(6),
      // position: BadgePosition.topEnd(top: 25, end: 25),
      showBadge: showBadge,
      badgeContent: Container(
        height: 15,
        width: 15,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
