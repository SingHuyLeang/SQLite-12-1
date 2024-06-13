import 'package:flutter/material.dart';
import 'package:note_app/common/component/icon_button.dart';
import 'package:note_app/common/component/n_app_bar.dart';
import 'package:note_app/common/style/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NAppBar(
        title: "Note App",
        actions: [
          NIcon(icon: "assets/icons/search.png"),
        ],
      ),
      body: ListView(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 200,
              color: NColors.primary,
            ),
          ),
        ),
      ),
      floatingActionButton: const CircleAvatar(
        backgroundColor: NColors.primary,
        radius: 30,
        child: NIcon(
          icon: 'assets/icons/add.png',
          w: 24,
          h: 24,
        ),
      ),
    );
  }
}
