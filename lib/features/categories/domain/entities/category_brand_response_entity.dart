class CetegoryBrandResponseEntity {
  CetegoryBrandResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  Metadata? metadata;
  List<Data>? data;


}

class Data {
  Data({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

}