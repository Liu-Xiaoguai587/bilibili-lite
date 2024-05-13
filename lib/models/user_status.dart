import 'package:flutter/material.dart';

//大会员 or 普通会员
class UserStatus extends StatelessWidget {
  const UserStatus({required this.status, super.key});
  //普通会员--1  大会员--2
  final int status;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Container(
          padding: const EdgeInsets.only(left: 3, right: 3, bottom: 2),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEF6F98), width: 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            //"正式会员",
            status == 1 ? "正式会员" : "大会员",
            style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFEF6F98),
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
