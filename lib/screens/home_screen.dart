import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';
import '../screens/coffee_shop_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Kahve Çeşitleri'),
            const SizedBox(height: 16),
            SizedBox(
              height: ResponsiveLayout.isMobile(context) ? 215 : 245,
              child: _buildCoffeeList(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Kahve Dükkanları'),
            const SizedBox(height: 16),
            _buildShopsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Kahve Çeşitleri'),
            const SizedBox(height: 16),
            SizedBox(
              height: 245,
              child: _buildCoffeeList(),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Kahve Dükkanları'),
            const SizedBox(height: 16),
            _buildTabletShopGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Kahve Çeşitleri'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 210,
                    child: _buildCoffeeList(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Kahve Dükkanları'),
                  const SizedBox(height: 16),
                  _buildDesktopShopGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    double fontSize = ResponsiveLayout.isMobile(context) ? 24 : 32;

    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
    );
  }

  Widget _buildCoffeeList() {
    return Builder(
      builder: (context) => ListView(
        scrollDirection: Axis.horizontal,
        children: Coffee.samples
            .map((coffee) => _buildCoffeeCard(
                  coffee.title,
                  coffee.subtitle,
                  coffee.imagePath,
                  () => Navigator.pushNamed(
                    context,
                    '/product-details',
                    arguments: {
                      'title': coffee.title,
                      'description': coffee.subtitle,
                      'image': coffee.imagePath,
                      'price': coffee.price,
                      'ingredients': coffee.ingredients,
                      'preparation': coffee.preparation,
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildShopsList() {
    return Column(
      children: CoffeeShop.samples
          .map((shop) => _buildCoffeeShopCard(
                shop.name,
                shop.address,
                shop.imagePath,
                shop.rating,
              ))
          .toList(),
    );
  }

  Widget _buildTabletShopGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: CoffeeShop.samples
          .map((shop) => _buildCoffeeShopCard(
                shop.name,
                shop.address,
                shop.imagePath,
                shop.rating,
              ))
          .toList(),
    );
  }

  Widget _buildDesktopShopGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: CoffeeShop.samples
          .map((shop) => _buildCoffeeShopCard(
                shop.name,
                shop.address,
                shop.imagePath,
                shop.rating,
              ))
          .toList(),
    );
  }

  Widget _buildCoffeeCard(
    String title,
    String subtitle,
    String imagePath,
    VoidCallback onTap,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = ResponsiveLayout.isMobile(context) ? 180 : 220;
        double imageHeight = cardWidth * 0.75; // Daha yüksek görsel oranı
        double titleSize = ResponsiveLayout.isMobile(context) ? 14 : 16;
        double subtitleSize = ResponsiveLayout.isMobile(context) ? 12 : 14;

        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: cardWidth,
              height: imageHeight + 80, // Daha kompakt alt alan
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: title,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        imagePath,
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleSize,
                                  color: Colors.brown[900],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                subtitle,
                                style: TextStyle(
                                  color: Colors.brown[600],
                                  fontSize: subtitleSize,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                size: subtitleSize,
                                color: Colors.brown[700],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Detaylar',
                                style: TextStyle(
                                  color: Colors.brown[700],
                                  fontSize: subtitleSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoffeeShopCard(
    String name,
    String address,
    String imagePath,
    double rating,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = ResponsiveLayout.isMobile(context) ? 150 : 200;
        double titleSize = ResponsiveLayout.isMobile(context) ? 18 : 22;
        double ratingSize = ResponsiveLayout.isMobile(context) ? 16 : 18;
        double addressSize = ResponsiveLayout.isMobile(context) ? 14 : 16;

        return InkWell(
          onTap: () {
            final shop =
                CoffeeShop.samples.firstWhere((shop) => shop.name == name);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoffeeShopDetailsScreen(shop: shop),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.brown.shade100,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imagePath,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    ResponsiveLayout.isMobile(context) ? 16 : 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: ratingSize,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toString(),
                                style: TextStyle(
                                  fontSize: ratingSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: addressSize,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            address,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: addressSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
