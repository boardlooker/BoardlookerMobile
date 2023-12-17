import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/widgets/index.dart';
import 'package:flutter/material.dart';

class LocationList extends StatefulWidget{
  final List<Location> locations;

  const LocationList({required this.locations, super.key});

  @override
  LocationListState createState() => LocationListState();
}

class LocationListState extends State<LocationList>{
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate:  SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 7.0),
              child: LocationListItem(location: widget.locations[index]),
            );
          },
          childCount: widget.locations.length,
        ),
    );
  }

}