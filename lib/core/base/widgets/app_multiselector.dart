import 'package:flutter/material.dart';

class AppMultiSelector extends StatefulWidget {
  final List<String> items;
  List<String>? selectedItems = [];
  final Function(List<String>?) onChanged;

  AppMultiSelector(
      {super.key,
      required this.items,
      required this.onChanged,
      this.selectedItems});

  @override
  _AppMultiSelectorState createState() => _AppMultiSelectorState();
}

class _AppMultiSelectorState extends State<AppMultiSelector> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isSelected = widget.selectedItems?.contains(item);

        return ListTile(
          title: Text(item),
          leading: Checkbox(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  if (value) {
                    widget.selectedItems?.add(item);
                    widget.onChanged(widget.selectedItems);
                  } else {
                    widget.selectedItems?.remove(item);
                    widget.onChanged(widget.selectedItems);
                  }
                }
              });
            },
          ),
        );
      },
    );
  }
}
