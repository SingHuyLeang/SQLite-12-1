import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/common/style/colors.dart';
import 'package:note_app/common/style/text_style.dart';
import 'package:note_app/feature/app/controller/note_controller.dart';
import 'package:note_app/feature/app/model/note_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NCard extends StatelessWidget {
  NCard({super.key, required this.note});
  final NoteModel note;
  final controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) async => controller.deleteNote(note),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async => controller.gotoUpdate(note),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              NText(
                text: note.title,
                size: 18,
              ),
              // note
              NText(
                text: note.note,
                size: 16,
                color: NColors.grey,
                overflow: TextOverflow.ellipsis,
                lines: 4,
              ),
              // date
              Align(
                alignment: Alignment.bottomRight,
                child: NText(
                  text: note.date,
                  size: 16,
                  color: NColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
