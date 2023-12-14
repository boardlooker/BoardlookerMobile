import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:boardlooker_mobile/models/index.dart';

extension LocationDtoExtension on Location{
  LocationFloor toLocationFloor(){
    return LocationFloor(
        id: id,
        title: title,
        location: location,
        locationCity: locationCity,
        locationAddress: locationAddress,
        locationType: locationType.value
    );
  }
}

extension LocationFloorExtension on LocationFloor{
  Location toLocationDto(){
    return Location(
        id: id,
        title: title,
        location: location,
        locationCity: locationCity,
        locationAddress: locationAddress,
        locationType: LocationType.fromString(locationType)!
    );
  }
}