import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:flutter/material.dart';

class FilterData extends InheritedWidget{
  final LocationType? data;
  final bool isActive;

  FilterData({
    super.key,
    required this.data,
    required this.isActive,
    required super.child
  });


  @override
  bool updateShouldNotify(FilterData oldWidget) => oldWidget.data != data
      || oldWidget.isActive != isActive;

  static FilterData? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<FilterData>();
}