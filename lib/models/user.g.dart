// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as int,
      json['username'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      _$enumDecode(_$UserTypeEnumMap, json['type']),
      json['avatar'] as String,
      json['companyId'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'type': _$UserTypeEnumMap[instance.type],
      'avatar': instance.avatar,
      'companyId': instance.companyId
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$UserTypeEnumMap = <UserType, dynamic>{
  UserType.employee: 'employee',
  UserType.employer: 'employer'
};
