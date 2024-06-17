import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/common/style/colors.dart';
import 'package:note_app/common/style/text_style.dart';
import 'package:note_app/feature/app/model/note_model.dart';

class NCard extends StatelessWidget {
  const NCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
