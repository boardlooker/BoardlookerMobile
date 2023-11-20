import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:equatable/equatable.dart';

part 'filesystem_event.dart';
part 'filesystem_state.dart';

class FilesystemBloc extends Bloc<FilesystemEvent, FilesystemState> {
  FilesystemBloc() : super(const FilesystemState()) {
    on<FreeDiskSpaceRequestedEvent>(_onFreeDiskSpaceRequested);
    on<TotalDiskSpaceRequestedEvent>(_onTotalDiskSpaceRequested);
  }

  _onFreeDiskSpaceRequested(FreeDiskSpaceRequestedEvent event, Emitter<FilesystemState> emit) async {
    try {
      var freeSize = await DiskSpacePlus.getFreeDiskSpace;
      emit(state.copyWith(freeDiskSpace: freeSize));
    } catch (e) {
      emit(state.copyWith(freeDiskSpace: null));
      log(e.toString());
    }
  }

  _onTotalDiskSpaceRequested(TotalDiskSpaceRequestedEvent event, Emitter<FilesystemState> emit) async {
    try {
      var totalSize = await DiskSpacePlus.getTotalDiskSpace;
      emit(state.copyWith(totalDiskSpace: totalSize));
    } catch (e) {
      emit(state.copyWith(totalDiskSpace: null));
      log(e.toString());
    }
  }
}
