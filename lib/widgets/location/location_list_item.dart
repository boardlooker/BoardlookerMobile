import 'package:boardlooker_mobile/models/index.dart';
import 'package:flutter/material.dart';

class LocationListItem extends StatelessWidget{
  final Location location;
  const LocationListItem({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      shape: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(3.0))
    ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${location.title}, ${location.locationType.value}',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
              color: Colors.black
            ),
            ),
            Text(location.locationAddress,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }

}