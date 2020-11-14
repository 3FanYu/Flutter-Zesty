class Meal {
  final int id;
  final String name;
  // final String description;
  // final int maximumPeople;
  // final int minimumPeople;
  final int price;
  // final bool remarks;
  // final int categoryId;
  // final String createdAt;
  // final String updatedAt;
  final String categoryName;
  final String path;
  final String chefName;
  final int stars;

  Meal(
    this.id,
    this.name,
    // this.description,
    // this.maximumPeople,
    // this.minimumPeople,
    this.price,
    // this.remarks,
    // this.categoryId,
    // this.createdAt,
    // this.updatedAt,
    this.categoryName,
    this.path, this.chefName, this.stars,
  );
}
