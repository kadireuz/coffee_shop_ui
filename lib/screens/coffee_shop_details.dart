import 'package:flutter/material.dart';
import '../models/coffee_shop.dart';
import '../models/coffee.dart';
import '../utils/responsive_layout.dart';

class CoffeeShopDetailsScreen extends StatelessWidget {
  final CoffeeShop shop;

  const CoffeeShopDetailsScreen({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            shop.imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildDescription(context),
                const SizedBox(height: 24),
                _buildCoffeeList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            shop.imagePath,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                _buildDescription(context),
                const SizedBox(height: 32),
                _buildCoffeeGrid(context, crossAxisCount: 2),
              ],
            ),
          ),
        ],
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      shop.imagePath,
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  _buildDescription(context),
                ],
              ),
            ),
            const SizedBox(width: 48),
            Expanded(
              flex: 3,
              child: _buildCoffeeGrid(context, crossAxisCount: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shop.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  shop.address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                shop.rating.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hakkında',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
        ),
        const SizedBox(height: 8),
        Text(
          shop.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.brown[700],
                height: 1.5,
              ),
        ),
      ],
    );
  }

  Widget _buildCoffeeList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kahve Menüsü',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
        ),
        const SizedBox(height: 16),
        ...shop.coffees.map((coffee) => _buildCoffeeCard(context, coffee)),
      ],
    );
  }

  Widget _buildCoffeeGrid(BuildContext context, {required int crossAxisCount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kahve Menüsü',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: shop.coffees
              .map((coffee) => _buildCoffeeCard(context, coffee))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCoffeeCard(BuildContext context, Coffee coffee) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.brown.shade100,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
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
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coffee.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    coffee.price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                coffee.subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'İçindekiler:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                coffee.ingredients.join(', '),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hazırlanış:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                coffee.preparation,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
