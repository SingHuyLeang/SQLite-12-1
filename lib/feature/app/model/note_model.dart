class NoteModel {
  int id;
  String title;
  String note;
  String date;

  NoteModel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
        "title": title,
        "note": note,
        "date": date,
      };
  NoteModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        note = map["note"],
        date = map["date"];
}
