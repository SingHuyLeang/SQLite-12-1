import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:note_app/common/component/card_view.dart';
import 'package:note_app/common/component/n_app_bar.dart';
import 'package:note_app/common/component/text_filed.dart';
import 'package:note_app/common/style/text_style.dart';
import 'package:note_app/feature/app/controller/note_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:note_app/feature/app/model/note_model.dart';

class FielterScreen extends StatelessWidget {
  FielterScreen({super.key});

  final controller = Get.put(NoteController());

  final items = ["Title", "Note"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NAppBar(
        title: 'Search',
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: NField(
                        controller: controller.fielterController,
                        hint: 'Search your note',
                        size: 16,
                        border: true,
                        lines: 1,
                        onChanged: (value) async =>
                            controller.onFielterTextChange(value),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: NText(text: item),
                              ),
                            )
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select item.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.selectedValue = value.toString();
                        },
                        onSaved: (value) {
                          controller.selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  controller.fielterNoted.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: 0,
                    ),
                    child: NCard(
                      note: NoteModel(
                        id: controller.fielterNoted[index].id,
                        title: controller.fielterNoted[index].title,
                        note: controller.fielterNoted[index].note,
                        date: controller.fielterNoted[index].date,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
