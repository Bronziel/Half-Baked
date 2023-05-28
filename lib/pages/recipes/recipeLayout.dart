class Recipe {
  final String title;
  final String description;
  final int portionSize;
  final List<String> steps;
  final List<Map<String, dynamic>> ingredients;
  final List<String> imageUrls;
  final String id;
  final int prepTime; // new field
  final int totalTime; // new field
  final List<String> equipment; // new field

  Recipe({
    required this.title,
    required this.description,
    required this.portionSize,
    required this.steps,
    required this.ingredients,
    required this.imageUrls,
    required this.id,
    required this.prepTime, // new field
    required this.totalTime, // new field
    required this.equipment, // new field
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      portionSize: json['portionSize'],
      steps: List<String>.from(json['steps']),
      ingredients: List<Map<String, dynamic>>.from(
          json['ingredients'].map((ingredient) => {
                'name': ingredient['name'],
                'amount': ingredient['amount'],
                'unit': ingredient['unit']
              })), // updated field
      imageUrls: List<String>.from(json['imageUrls']),
      id: json['id'] as String,
      prepTime: json['prepTime'] ?? 0, // new field
      totalTime: json['totalTime'] ?? 0, // new field
      equipment: List<String>.from(json['equipment'] ?? []), // new field
    );
  }
}
