// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      id: fields[0] as int,
      Year: fields[1] as int,
      Title: fields[2] as String,
      handle: fields[3] as String,
      Publisher: fields[4] as String,
      ISBN: fields[5] as String,
      Pages: fields[6] as int,
      Notes: (fields[7] as List).cast<String>(),
      created_at: fields[8] as String,
      villains: (fields[9] as List).cast<Villains>(),
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.Year)
      ..writeByte(2)
      ..write(obj.Title)
      ..writeByte(3)
      ..write(obj.handle)
      ..writeByte(4)
      ..write(obj.Publisher)
      ..writeByte(5)
      ..write(obj.ISBN)
      ..writeByte(6)
      ..write(obj.Pages)
      ..writeByte(7)
      ..write(obj.Notes)
      ..writeByte(8)
      ..write(obj.created_at)
      ..writeByte(9)
      ..write(obj.villains);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: (json['id'] as num).toInt(),
      Year: (json['Year'] as num).toInt(),
      Title: json['Title'] as String,
      handle: json['handle'] as String,
      Publisher: json['Publisher'] as String,
      ISBN: json['ISBN'] as String,
      Pages: (json['Pages'] as num).toInt(),
      Notes: (json['Notes'] as List<dynamic>).map((e) => e as String).toList(),
      created_at: json['created_at'] as String,
      villains: (json['villains'] as List<dynamic>)
          .map((e) => Villains.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'Year': instance.Year,
      'Title': instance.Title,
      'handle': instance.handle,
      'Publisher': instance.Publisher,
      'ISBN': instance.ISBN,
      'Pages': instance.Pages,
      'Notes': instance.Notes,
      'created_at': instance.created_at,
      'villains': instance.villains,
    };
