// import 'package:json_annotation/json_annotation.dart';

// import 'villains.dart'; // Villain modelini içeri aktar

// part 'book.g.dart';

// @JsonSerializable()
// class Book {
//   final int id;
//   final int Year;
//   final String Title;
//   final String handle;
//   final String Publisher;
//   final String ISBN;
//   final int Pages;
//   final List<String> Notes;
//   final String created_at;
//   final List<Villains> villains;

//   Book({
//     required this.id,
//     required this.Year,
//     required this.Title,
//     required this.handle,
//     required this.Publisher,
//     required this.ISBN,
//     required this.Pages,
//     required this.Notes,
//     required this.created_at,
//     required this.villains,
//   });

// ignore_for_file: non_constant_identifier_names

//   factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
//   Map<String, dynamic> toJson() => _$BookToJson(this);
// }
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'villains.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Book extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int Year;

  @HiveField(2)
  final String Title;

  @HiveField(3)
  final String handle;

  @HiveField(4)
  final String Publisher;

  @HiveField(5)
  final String ISBN;

  @HiveField(6)
  final int Pages;

  @HiveField(7)
  final List<String> Notes;

  @HiveField(8)
  final String created_at;

  @HiveField(9)
  final List<Villains> villains;

  Book({
    required this.id,
    required this.Year,
    required this.Title,
    required this.handle,
    required this.Publisher,
    required this.ISBN,
    required this.Pages,
    required this.Notes,
    required this.created_at,
    required this.villains,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
