import 'package:awesome_app/domain/entities/photo_list_entity.dart';

import 'photo_model.dart';

class PhotoListModel extends PhotoListEntity {
  PhotoListModel({
    required super.page,
    required super.perPage,
    required List<PhotoModel> super.photos,
    super.nextPage,
  });

  factory PhotoListModel.fromJson(Map<String, dynamic> json) {
    return PhotoListModel(
      page: json['page'],
      perPage: json['per_page'],
      photos: List<PhotoModel>.from(
        json['photos'].map((photoJson) => PhotoModel.fromJson(photoJson)),
      ),
      nextPage: json['next_page'],
    );
  }
}
