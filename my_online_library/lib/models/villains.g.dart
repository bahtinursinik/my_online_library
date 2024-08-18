// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'villains.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VillainsAdapter extends TypeAdapter<Villains> {
  @override
  final int typeId = 1;

  @override
  Villains read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Villains(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Villains obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VillainsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Villains _$VillainsFromJson(Map<String, dynamic> json) => Villains(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VillainsToJson(Villains instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
