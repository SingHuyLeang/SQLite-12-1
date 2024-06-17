import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/common/component/card_view.dart';
import 'package:note_app/common/component/icon_button.dart';
import 'package:note_app/common/component/n_app_bar.dart';
import 'package:note_app/common/style/colors.dart';
import 'package:note_app/feature/app/model/note_model.dart';
import 'package:note_app/feature/app/view/form/form.dart';

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
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: 0,
            ),
            child: NCard(
              note: NoteModel(
                id: 1,
                title: "Title",
                note:
                    "NoteModel({required int id, required String title, required String note, required String date})",
                date: "17-06-2024",
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => FormNote()),
        child: const CircleAvatar(
          backgroundColor: NColors.primary,
          radius: 30,
          child: NIcon(
            icon: 'assets/icons/add.png',
            w: 24,
            h: 24,
          ),
        ),
      ),
    );
  }
}
