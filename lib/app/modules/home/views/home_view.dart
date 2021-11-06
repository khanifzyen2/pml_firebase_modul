import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> myChats = List.generate(
    20,
    (index) => ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(
        "Orang ke ${index + 1}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        "Status orang ke ${index + 1}",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Chip(
        label: Text("3"),
      ),
    ),
  ).reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chats",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myChats.length,
                itemBuilder: (context, index) => myChats[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
