part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class LocationListRequestedEvent extends LocationEvent {
  final String? city;
  final String? nameRegex;
  final String? locType;

  LocationListRequestedEvent({this.city, this.locType, this.nameRegex});
}

class LocationRequestedEvent extends LocationEvent {
  final int id;

  LocationRequestedEvent({required this.id});
}

class LocationListReceivedEvent extends LocationEvent {
  final List<Location>? location;
  LocationListReceivedEvent({this.location});
}
