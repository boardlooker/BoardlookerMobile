import 'dart:async';
import 'dart:developer';

import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';
part 'location_event.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState>{
  final ILocationRepository _locationRepository;
  final ILocationLocalRepository _locationLocalRepository;
  StreamSubscription? _subscription;

  LocationBloc(this._locationRepository, this._locationLocalRepository)
      : super(const LocationState()){
    on<LocationListRequestedEvent>(_onLocationsListRequested);
    on<LocationListReceivedEvent>(_onLocationsListReceived);
    on<LocationRequestedEvent>(_onLocationRequested);

    _subscription = _locationLocalRepository.getLocationList().listen((locations) {
      add(LocationListReceivedEvent(location: locations));
    });
  }

  _onLocationRequested(LocationRequestedEvent event, Emitter<LocationState> emit) async{
    try{
      emit(state.copyWith(requestState: RequestState.loading));
      var locationRes = await _locationRepository.getLocationById(event.id);
      if(locationRes.statusCode == 200){
        List<Location> locations = [];
        for(var location in locationRes.data){
          locations.add(Location.fromJson(location));
        }

        await _locationLocalRepository.syncObjects(locations);
        await _locationLocalRepository.saveLocationList(locations);

        emit(state.copyWith(requestState: RequestState.success));
      } else {
        emit(state.copyWith(requestState: RequestState.error));
      }
    }  catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
      log(e.toString());
    }
  }
  _onLocationsListRequested(LocationListRequestedEvent event, Emitter<LocationState> emit) async {
    try{
      emit(state.copyWith(requestState: RequestState.loading));
      var locationRes = await _locationRepository.getLocations(
          event.city,
          event.nameRegex,
          event.locType
      );
      if (locationRes.statusCode == 200){
        List<Location> locations = [];
        for(var location in locationRes.data){
          locations.add(Location.fromJson(location));
        }

        await _locationLocalRepository.syncObjects(locations);
        await _locationLocalRepository.saveLocationList(locations);

        emit(state.copyWith(requestState: RequestState.success));

      } else {
        emit(state.copyWith(requestState: RequestState.error));
      }
    }  catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
      log(e.toString());
    }
  }

  _onLocationsListReceived(LocationListReceivedEvent event, Emitter<LocationState> emit) {
    emit(state.copyWith(locations: event.location));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
  }