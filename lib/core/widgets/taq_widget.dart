import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final List<String> tags;

  TagWidget({required this.tags});

  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  List<bool> _isSelectedList = [];

  @override
  void initState() {
    super.initState();
    _isSelectedList = List.generate(widget.tags.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(widget.tags.length, (index) {
        return FilterChip(
          label: Text(widget.tags[index]),
          selected: _isSelectedList[index],
          onSelected: (isSelected) {
            // setState(() {
            //   _isSelectedList[index] = isSelected;
            // });
          },
        );
      }),
    );
  }
}
