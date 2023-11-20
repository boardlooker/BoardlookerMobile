part of 'filesystem_bloc.dart';

class FilesystemState extends Equatable {
  final double? freeDiskSpace;
  final double? totalDiskSpace;

  const FilesystemState({this.freeDiskSpace, this.totalDiskSpace});

  @override
  List<dynamic> get props => [freeDiskSpace, totalDiskSpace];

  FilesystemState copyWith({
    double? freeDiskSpace,
    double? totalDiskSpace,
  }) {
    return FilesystemState(
        freeDiskSpace: freeDiskSpace ?? this.freeDiskSpace, totalDiskSpace: totalDiskSpace ?? this.totalDiskSpace);
  }
}
