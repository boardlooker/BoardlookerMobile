import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_access_state.dart';

class InternetAccessCubit extends Cubit<InternetAccessState> {
  late final StreamSubscription<InternetConnectionStatus> _subscription;

  InternetAccessCubit() : super(const InternetAccessState()) {
    _subscription = InternetConnectionChecker.createInstance(
            checkInterval: const Duration(seconds: 10), checkTimeout: const Duration(seconds: 10))
        .onStatusChange
        .listen((result) async {
      emit(state.copyWith(
          status: result == InternetConnectionStatus.connected
              ? InternetAccessStatus.online
              : InternetAccessStatus.offline));
    });
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  // @override
  // InternetAccessState? fromJson(Map<String, dynamic> json) =>
  //     InternetAccessState.fromMap(json);

  // @override
  // Map<String, dynamic>? toJson(InternetAccessState state) => state.toMap();
}
