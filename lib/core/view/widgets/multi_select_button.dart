import 'package:flutter/material.dart';
import 'package:kafil/export.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MultiSelectButton extends StatefulWidget {
  const MultiSelectButton({
    Key? key,
    required this.title,
    required this.onConfirm,
    required this.allChoices,
    required this.chosen,
    this.isNameEn = true,
    this.isSingle = false,
  }) : super(key: key);
  final void Function(List<dynamic>) onConfirm;
  final String title;
  final bool isNameEn;
  final bool isSingle;

  ///this must be list of object that has name property or to be List<String>
  final List<dynamic> allChoices;
  final List<dynamic> chosen;

  @override
  State<MultiSelectButton> createState() => _MultiSelectButtonState();
}

class _MultiSelectButtonState extends State<MultiSelectButton> {
  List choices = [];
  @override
  void initState() {
    choices = widget.chosen;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (ctx) {
            return MultiSelectDialog(
              initialValue: choices,
              searchHint: 'search',
              separateSelectedItems: true,
              onSelectionChanged: (list) {
                if (widget.isSingle) {
                  list = [list.last];
                  if (list.length > 0) {
                    choices = list;
                    setState(() {});
                    Navigator.pop(context);
                  }
                }
              },
              searchable: true,
              items: widget.allChoices
                  .map((e) => MultiSelectItem(
                      e,
                      e.runtimeType == String
                          ? e
                          : (widget.isNameEn ? e.name : e.engName)))
                  .toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                choices = values;
                setState(() {});
                widget.onConfirm(choices);
              },
            );
          },
        );
      },
      child: Container(
        color: kGreyColor,
        height: 94.r,
        width: double.infinity,
        child: choices.isEmpty
            ? Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).p12()
            : Wrap(
                children: [
                  for (var e in choices)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Chip(
                        color: MaterialStatePropertyAll(
                            kPrimaryColor.withOpacity(.1)),
                        iconTheme: Theme.of(context).iconTheme.copyWith(
                              color: kPrimaryColor.withOpacity(.6),
                            ),
                        side: BorderSide(
                          color: kPrimaryColor.withOpacity(.6),
                        ),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: kPrimaryColor),
                        label: Text(e.runtimeType == String
                            ? e
                            : (widget.isNameEn ? e.name : e.engName)),
                        onDeleted: () {
                          choices.remove(e);
                          setState(() {});
                        },
                      ),
                    ),
                ],
              ),
      ).cornerRadius(16),
    );
  }
}
