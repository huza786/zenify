import 'package:flutter/material.dart';

class ExpandItem {
  final String headerText;
  final String expandedText;
  bool isExpanded;
  ExpandItem(
      {required this.expandedText,
      required this.headerText,
      required this.isExpanded});
}

class ExpandedCardProvider with ChangeNotifier {
  List<ExpandItem> expandList = [
    ExpandItem(
        expandedText: 'Item details',
        headerText:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        isExpanded: true),
    ExpandItem(
        expandedText: 'Shipping info',
        headerText:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        isExpanded: true),
    ExpandItem(
        expandedText: 'Support',
        headerText:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        isExpanded: true),
  ];
  void expandCard(int index, bool expanded) {
    expandList[index].isExpanded = !expanded;
    notifyListeners();
  }
}
