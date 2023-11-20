part of 'filesystem_bloc.dart';

abstract class FilesystemEvent {}

class FreeDiskSpaceRequestedEvent extends FilesystemEvent {}

class TotalDiskSpaceRequestedEvent extends FilesystemEvent {}
