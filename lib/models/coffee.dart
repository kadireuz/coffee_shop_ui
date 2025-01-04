class Coffee {
  final String title;
  final String subtitle;
  final String imagePath;
  final String price;
  final List<String> ingredients;
  final String preparation;

  const Coffee({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    required this.ingredients,
    required this.preparation,
  });

  static List<Coffee> samples = [
    Coffee(
      title: 'Espresso',
      subtitle: 'Saf kahve deneyimi',
      imagePath: 'assets/images/coffee.jpg',
      price: '',
      ingredients: ['Espresso Shot'],
      preparation: '30-35 saniye demleme süresi',
    ),
    Coffee(
      title: 'Latte',
      subtitle: 'Süt ve espresso uyumu',
      imagePath: 'assets/images/chocolate-mint-cappuccino.jpg',
      price: '',
      ingredients: ['Espresso Shot', 'Buharlanmış Süt', 'Süt Köpüğü'],
      preparation: '2-3 dakika hazırlık süresi',
    ),
    Coffee(
      title: 'Cappuccino',
      subtitle: 'İtalyan klasiği',
      imagePath: 'assets/images/cappucino_milk.jpg',
      price: '',
      ingredients: ['Espresso Shot', 'Buharlanmış Süt', 'Yoğun Süt Köpüğü'],
      preparation: '2-3 dakika hazırlık süresi',
    ),
  ];
}
