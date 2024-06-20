import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/common/popuns/loader.dart';
import 'package:note_app/database/note_db.dart';
import 'package:note_app/feature/app/model/note_model.dart';

class NoteController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  Future<void> get() async {
    notes.clear();
    await NoteDatabase().getAll().then((value) => notes.addAll(value));
  }

  final RxList<NoteModel> notes = <NoteModel>[].obs;

  final titleController = TextEditingController();
  final noteController = TextEditingController();
  String currentDate() {
    DateTime date = DateTime.now();
    return DateFormat("dd-MM-yyyy").format(date);
  }

  void addNote() {
    try {
      if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
        NoteDatabase()
            .insert(NoteModel(
                id: 0,
                title: titleController.text,
                note: noteController.text,
                date: currentDate()))
            .whenComplete(() {
          get();
          Loader.successSnackBar(message: "Note is added");
        });
      } else {
        Loader.warningSnackBar(message: "Please enter all field");
      }
    } catch (e) {
      Loader.errorSnackBar(message: "Something want wrong");
      log("Error ${e.toString()}");
    } finally {
      titleController.text = "";
      noteController.text = "";
    }
  }
}
