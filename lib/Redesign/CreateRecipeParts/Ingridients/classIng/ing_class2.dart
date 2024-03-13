class Ingredients {
  final String label;
  final String amount;
  final String unit;

  Ingredients({required this.label, required this.amount, required this.unit});
}

final List<Ingredients> ingredients = [
  Ingredients(label: 'maricha sås', amount: '300', unit: 'ml'),
  Ingredients(label: 'Jordgubbssylt', amount: '4', unit: 'dl'),
  Ingredients(label: 'Kebabkött', amount: '400', unit: 'g'),
  Ingredients(label: 'vitlöksås', amount: '1', unit: 'l'),
  Ingredients(label: 'vitlök', amount: '2', unit: 'st'),
  Ingredients(label: 'gullök', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'honung', amount: '1000', unit: 'ml'),
  Ingredients(label: 'socker', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'mjölk', amount: '1000', unit: 'ml'),
  Ingredients(label: 'Bröd', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'Fetaost', amount: '1000', unit: 'ml'),
  Ingredients(label: 'Ketchup', amount: '2000', unit: 'tsk'),
  // ... more items
];
