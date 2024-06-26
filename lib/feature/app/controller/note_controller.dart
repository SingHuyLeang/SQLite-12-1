import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/common/popuns/loader.dart';
import 'package:note_app/database/note_db.dart';
import 'package:note_app/feature/app/model/note_model.dart';
import 'package:note_app/feature/app/view/form/form.dart';
import 'package:note_app/feature/app/view/home/home_screen.dart';

class NoteController extends GetxController {
  @override
  void onInit() {
    getNote();
    super.onInit();
  }

  Future<void> getNote() async {
    notes.clear();
    await NoteDatabase().getAll().then((value) => notes.addAll(value));
  }

  final RxList<NoteModel> notes = <NoteModel>[].obs;
  final RxList<NoteModel> fielterNoted = <NoteModel>[].obs;

  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final fielterController = TextEditingController();
  late int dtoId;
  String? selectedValue;

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
          getNote().whenComplete(() => Get.to(() => HomeScreen()));
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

  void updateNote() {
    try {
      if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
        NoteDatabase()
            .update(NoteModel(
                id: dtoId,
                title: titleController.text,
                note: noteController.text,
                date: currentDate()))
            .whenComplete(() {
          getNote().whenComplete(() => Get.to(() => HomeScreen()));
          Loader.successSnackBar(message: "Note is updated");
        });
      } else {
        Loader.warningSnackBar(message: "Please enter all field");
      }
    } catch (e) {
      Loader.errorSnackBar(message: "Something want wrong");
      log("Error ${e.toString()}");
    } finally {
      dtoId = -1;
      titleController.text = "";
      noteController.text = "";
    }
  }

  gotoUpdate(NoteModel note) async {
    dtoId = note.id;
    titleController.text = note.title;
    noteController.text = note.note;
    Get.to(() => FormNote(isUpdate: true));
    update();
  }

  deleteNote(NoteModel model) async {
    try {
      NoteDatabase().delete(model).whenComplete(() {
        getNote();
        Loader.successSnackBar(message: "Note is deleted");
      });
    } catch (e) {
      Loader.errorSnackBar(message: "Something want wrong");
      log("Error ${e.toString()}");
    }
  }

  void onFielterTextChange(String value) async {
    if (value.isEmpty) {
      fielterNoted.clear();
    } else {
      if (selectedValue == "Title") {
        for (var note in notes) {
          if (value.toLowerCase() == note.title.toLowerCase()) {
            log('title = ${note.title}');
            fielterNoted.add(note);
          }
        }
      } else if (selectedValue == "Note") {
        for (var note in notes) {
          if (value.toLowerCase() == note.note.toLowerCase()) {
            log('title = ${note.title}');
            fielterNoted.add(note);
          }
        }
      }
    }
    update();
  }
}
