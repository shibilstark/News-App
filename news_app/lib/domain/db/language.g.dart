// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsLanguageAdapter extends TypeAdapter<NewsLanguage> {
  @override
  final int typeId = 1;

  @override
  NewsLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsLanguage(
      currentLang: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsLanguage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.currentLang);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
