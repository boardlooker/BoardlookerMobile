part of 'location_bloc.dart';

class LocationState extends Equatable{
  final RequestState? requestState;
  final List<Location>? locations;

  const LocationState({this.requestState = RequestState.unknown, this.locations});

  @override
  List<dynamic> get props => [requestState, locations];

  LocationState copyWith({RequestState? requestState, List<Location>? locations}) {
    return LocationState(requestState: requestState ?? this.requestState, locations: locations ?? this.locations);
  }
}