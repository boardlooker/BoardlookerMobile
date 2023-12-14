import 'package:floor/floor.dart';

@Entity(
  tableName: "locations"
)
class LocationFloor {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String title;
  final String location;
  @ColumnInfo(name: 'location_city')
  final String locationCity;
  @ColumnInfo(name: 'location_address')
  final String locationAddress;
  @ColumnInfo(name: 'location_type')
  final String locationType;

  const LocationFloor({
    required this.id,
    required this.title,
    required this.location,
    required this.locationCity,
    required this.locationAddress,
    required this.locationType,
  });
}