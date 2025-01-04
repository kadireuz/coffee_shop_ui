import 'coffee.dart';

class CoffeeShop {
  final String name;
  final String address;
  final String imagePath;
  final double rating;
  final String description;
  final List<Coffee> coffees;

  const CoffeeShop({
    required this.name,
    required this.address,
    required this.imagePath,
    required this.rating,
    required this.description,
    required this.coffees,
  });

  static const List<CoffeeShop> samples = [
    CoffeeShop(
      name: 'Kahve Durağı',
      address: 'Merkez Mah. Kahve Sk. No:1',
      imagePath: 'assets/images/flutter_logo.png',
      rating: 4.5,
      description:
          'Şehrin merkezinde, ev yapımı lezzetleriyle öne çıkan sıcak bir mekan.',
      coffees: <Coffee>[
        Coffee(
          title: 'Espresso',
          subtitle: 'Saf kahve deneyimi',
          imagePath: 'assets/images/coffee.jpg',
          price: '₺45',
          ingredients: <String>['Espresso Shot'],
          preparation: '30-35 saniye demleme süresi',
        ),
        Coffee(
          title: 'Latte',
          subtitle: 'Süt ve espresso uyumu',
          imagePath: 'assets/images/chocolate-mint-cappuccino.jpg',
          price: '₺55',
          ingredients: <String>[
            'Espresso Shot',
            'Buharlanmış Süt',
            'Süt Köpüğü'
          ],
          preparation: '2-3 dakika hazırlık süresi',
        ),
      ],
    ),
    CoffeeShop(
      name: 'Coffee Lab',
      address: 'Atatürk Cad. No:42',
      imagePath: 'assets/images/flutter_logo.png',
      rating: 4.8,
      description:
          'Modern dekorasyon ve özel kahve çeşitleriyle kahve tutkunlarının tercihi.',
      coffees: <Coffee>[
        Coffee(
          title: 'Cappuccino',
          subtitle: 'İtalyan klasiği',
          imagePath: 'assets/images/cappucino_milk.jpg',
          price: '₺50',
          ingredients: <String>[
            'Espresso Shot',
            'Buharlanmış Süt',
            'Yoğun Süt Köpüğü'
          ],
          preparation: '2-3 dakika hazırlık süresi',
        ),
        Coffee(
          title: 'Cold Brew',
          subtitle: 'Soğuk demleme keyfi',
          imagePath: 'assets/images/coffee.jpg',
          price: '₺45',
          ingredients: <String>['Özel Kavrum Kahve', 'Soğuk Su'],
          preparation: '24 saat demleme',
        ),
      ],
    ),
    CoffeeShop(
      name: 'Bean & Beyond',
      address: 'Sahil Yolu No:15',
      imagePath: 'assets/images/flutter_logo.png',
      rating: 4.3,
      description: 'Deniz manzarasına karşı kahve keyfi sunan ferah mekan.',
      coffees: <Coffee>[
        Coffee(
          title: 'V60',
          subtitle: 'Pour over yöntemiyle',
          imagePath: 'assets/images/coffee.jpg',
          price: '₺40',
          ingredients: <String>['Öğütülmüş Kahve', 'Sıcak Su'],
          preparation: '3-4 dakika demleme',
        ),
        Coffee(
          title: 'Chemex',
          subtitle: 'Aromalı filtre kahve',
          imagePath: 'assets/images/coffee.jpg',
          price: '₺42',
          ingredients: <String>['Öğütülmüş Kahve', 'Sıcak Su'],
          preparation: '5-6 dakika demleme',
        ),
      ],
    ),
  ];
}
