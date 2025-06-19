import '../../domain/entities/category_brand_response_entity.dart';

class CetegoryBrandResponseDm extends CetegoryBrandResponseEntity {
  CetegoryBrandResponseDm({
    super.results,
    super.metadata,
    super.data,
  });

  CetegoryBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = (metadata as MetadataDm)?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => (v as DataDm).toJson()).toList();
    }
    return map;
  }
}

class DataDm extends Data {
  DataDm({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  DataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class MetadataDm extends Metadata {
  MetadataDm({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }
}
