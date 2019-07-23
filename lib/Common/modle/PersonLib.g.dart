// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonLib.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonLib _$PersonLibFromJson(Map<String, dynamic> json) {
  return PersonLib(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['userName'] as String,
      json['cardNo'] as String,
      json['tel'] as String,
      json['phone'] as String,
      json['sex'] as String,
      json['email'] as String,
      json['address'] as String,
      json['familyName'] as String,
      json['birthday'] as String,
      json['naturalState'] as String,
      json['loginName'] as String,
      json['password'] as String,
      json['countHistory'] as int,
      json['countStuff'] as int,
      json['countBespeak'] as int,
      json['countPatrol'] as int,
      json['countCases'] as int,
      json['countLicence'] as int,
      json['stuffStr'] as String,
      json['quHaoNum'] as int,
      json['limitNum'] as int);
}

Map<String, dynamic> _$PersonLibToJson(PersonLib instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'userName': instance.userName,
      'cardNo': instance.cardNo,
      'tel': instance.tel,
      'phone': instance.phone,
      'sex': instance.sex,
      'email': instance.email,
      'address': instance.address,
      'familyName': instance.familyName,
      'birthday': instance.birthday,
      'naturalState': instance.naturalState,
      'loginName': instance.loginName,
      'password': instance.password,
      'countHistory': instance.countHistory,
      'countStuff': instance.countStuff,
      'countBespeak': instance.countBespeak,
      'countPatrol': instance.countPatrol,
      'countCases': instance.countCases,
      'countLicence': instance.countLicence,
      'stuffStr': instance.stuffStr,
      'quHaoNum': instance.quHaoNum,
      'limitNum': instance.limitNum
    };
