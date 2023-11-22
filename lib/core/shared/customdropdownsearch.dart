import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;

  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedID;

  const CustomDropDownSearch(
      {Key? key,
      this.title,
      required this.listdata,
      required this.dropdownSelectedName,
      required this.dropdownSelectedID})
      : super(key: key);

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelectedName.text = selectedListItem.name;
          widget.dropdownSelectedID.text = selectedListItem.value!;
          print("================================= ");
          print(widget.dropdownSelectedName.text);
          print(widget.dropdownSelectedID.text);
          print("================================= ");
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
          hintText: widget.dropdownSelectedName.text == ""
              ? widget.title
              : widget.dropdownSelectedName.text,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                widget.dropdownSelectedName.text == ""
                    ? widget.title!
                    : widget.dropdownSelectedName.text,
              )),
          suffixIcon:
              InkWell(child: const Icon(Icons.arrow_drop_down), onTap: () {}),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
