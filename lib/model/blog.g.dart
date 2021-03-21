// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) {
  return Blog()
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>
    ..title = json['title'] as String
    ..subTitle = json['subTitle'] as String
    ..des = json['des'] as String
    ..blog = json['blog'] as String
    ..author = json['author'] as String
    ..date = json['date'] as String
    ..category = json['category'] as String;
}

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'des': instance.des,
      'blog': instance.blog,
      'author': instance.author,
      'date': instance.date,
      'category': instance.category,
    };
