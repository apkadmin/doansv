// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 0;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      id: fields[0] as String,
      username: fields[1] as String,
      email: fields[2] as String,
      role: fields[3] as String,
      accessToken: fields[4] as String,
      idStudent: fields[5] as String,
      nameStudent: fields[6] as String,
      birthday: fields[7] as String,
      address: fields[8] as String,
      phone: fields[9] as String,
      code: fields[10] as String,
      idClass: fields[11] as String,
      majors: fields[12] as String,
      schoolYear: fields[13] as String,
      image: fields[14] as String,
      idProject: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.accessToken)
      ..writeByte(5)
      ..write(obj.idStudent)
      ..writeByte(6)
      ..write(obj.nameStudent)
      ..writeByte(7)
      ..write(obj.birthday)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.phone)
      ..writeByte(10)
      ..write(obj.code)
      ..writeByte(11)
      ..write(obj.idClass)
      ..writeByte(12)
      ..write(obj.majors)
      ..writeByte(13)
      ..write(obj.schoolYear)
      ..writeByte(14)
      ..write(obj.image)
      ..writeByte(15)
      ..write(obj.idProject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
