part of 'internet_access_cubit.dart';

class InternetAccessState extends Equatable {
  final InternetAccessStatus status;

  const InternetAccessState({
    this.status = InternetAccessStatus.unknown,
  });

  @override
  List<dynamic> get props => [status];

  InternetAccessState copyWith({
    InternetAccessStatus? status,
  }) {
    return InternetAccessState(
      status: status ?? this.status,
    );
  }

  factory InternetAccessState.fromMap(Map<String, dynamic> map) {
    return InternetAccessState(status: InternetAccessStatus.fromString(map['status']) ?? InternetAccessStatus.unknown);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"status": status.value};
  }
}
