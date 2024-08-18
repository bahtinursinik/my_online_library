// import 'package:json_annotation/json_annotation.dart';

// part 'villains.g.dart';

// @JsonSerializable()
// class Villains {
//   final String name;
//   final String url;

//   Villains({
//     required this.name,
//     required this.url,
//   });

//   factory Villains.fromJson(Map<String, dynamic> json) =>
//       _$VillainsFromJson(json);
//   Map<String, dynamic> toJson() => _$VillainsToJson(this);
// }
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'villains.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Villains extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  Villains({
    required this.name,
    required this.url,
  });

  factory Villains.fromJson(Map<String, dynamic> json) =>
      _$VillainsFromJson(json);
  Map<String, dynamic> toJson() => _$VillainsToJson(this);
}
