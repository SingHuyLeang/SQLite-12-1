import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/common/component/n_app_bar.dart';
import 'package:note_app/common/component/text_filed.dart';
import 'package:note_app/common/style/colors.dart';
import 'package:note_app/common/style/text_style.dart';
import 'package:note_app/feature/app/controller/note_controller.dart';

class FormNote extends StatelessWidget {
  FormNote({super.key, this.isUpdate = false});
  final bool isUpdate;
  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NAppBar(
        showBackArrow: true,
        title: "Form Note",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // title
            NField(
              size: 18,
              controller: controller.titleController,
              hint: "Title",
            ),
            // note
            NField(
              color: NColors.grey,
              size: 18,
              controller: controller.noteController,
              hint: "Note",
            ),
            // date
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 8),
              child: NText(text: controller.currentDate(), color: NColors.grey),
            ),
            // save
            const SizedBox(height: 15),
            CupertinoButton(
              color: NColors.primary,
              child: const NText(text: 'Save', color: NColors.light),
              onPressed: () => !isUpdate ? controller.addNote() : controller.updateNote(),
            ),
          ],
        ),
      ),
    );
  }
}
