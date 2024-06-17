import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteController extends GetxController {
  
  static String date() {
    DateTime date = DateTime.now();
    return DateFormat("dd-MM-yyyy").format(date);
  }
}
