import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required final int id,
    required final String title,
    required final String location,
    @JsonKey(name: "location_city")
    required final String locationCity,
    @JsonKey(name: "location_address")
    required final String locationAddress,
    @JsonKey(name: "location_type")
    required final LocationType locationType,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}