class Recipe {
  final String title;
  final String description;
  final int portionSize;
  final List<String> steps;
  final List<Map<String, dynamic>> ingredients;
  final List<String> imageUrls;

  Recipe({
    required this.title,
    required this.description,
    required this.portionSize,
    required this.steps,
    required this.ingredients,
    required this.imageUrls,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      portionSize: json['portionSize'],
      steps: List<String>.from(json['steps']),
      ingredients: List<Map<String, dynamic>>.from(json['ingredients'].map(
          (ingredient) =>
              {'name': ingredient['name'], 'amount': ingredient['amount']})),
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }
}
