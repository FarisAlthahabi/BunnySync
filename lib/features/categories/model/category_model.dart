class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.transactions,
    required this.description,
  });
  final int id;
  final String name;
  final double transactions;
  final String description;
}
