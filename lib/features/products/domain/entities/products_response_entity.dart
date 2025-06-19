class ProductsResponseEntity {
  ProductsResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});

  num? results;
  Metadata? metadata;
  List<Product>? data;


}

class Product {
  Product({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
});

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;


}

class Brand {
  Brand({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});
  String? id;
  String? name;
  String? slug;
  String? image;



}

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});


  String? id;
  String? name;
  String? slug;
  String? category;


}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

}