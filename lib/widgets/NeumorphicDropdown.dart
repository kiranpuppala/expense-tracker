import 'package:dotted_line/dotted_line.dart';
import 'package:expense_tracker/commons/Styles.dart';
import 'package:expense_tracker/resources/values/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicDropdown extends StatefulWidget {
  final String label;
  final List<String> entries;
  final ValueChanged<String> onSelected;

  NeumorphicDropdown(
      {Key key,
      @required this.label,
      this.entries = const <String>[],
      this.onSelected})
      : super(key: key);

  @override
  _NeumorphicDropdownState createState() => _NeumorphicDropdownState();
}

class _NeumorphicDropdownState extends State<NeumorphicDropdown> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  bool _enabled = false;

  String selectedItem;

  void _handleTap() {
    setState(() {
      _enabled = !_enabled;
    });
  }

  void _handleSelection(String item) {
    setState(() {
      _enabled = false;
      selectedItem = item;
      widget.onSelected(selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: NeumorphicButton(
          onPressed: _handleTap,
          style: neumorphicStyle(context),
          padding: EdgeInsets.only(left: 24, bottom: 19, top: 19, right: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem != null ? selectedItem : widget.label,
                    style: hintStyle(context),
                  ),
                  Icon(_enabled ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: AppColors.PRIMARY_COLOR),
                ],
              ),
              Visibility(
                visible: _enabled,
                child: Padding(
                  padding: EdgeInsets.only(top: 19),
                  child: DottedLine(
                      dashLength: 8,
                      dashColor: NeumorphicTheme.defaultTextColor(context),
                      dashGapLength: 4),
                ),
              ),
              Visibility(
                  visible: _enabled,
                  child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 90),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.only(top: 19),
                                child: GestureDetector(
                                  onTap: () {
                                    _handleSelection(widget.entries[index]);
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${widget.entries[index]}',
                                          style: hintStyle(context),
                                        ),
                                        Icon(Icons.chevron_right,
                                            size: 24,
                                            color: AppColors.PRIMARY_COLOR),
                                      ]),
                                ));
                          }))),
            ],
          ),
        ));
  }
}
