import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/coffee_getstarted.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    'Kahve Keyfi Başlasın',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'En iyi kahve çeşitleri ve kahve dükkanları burada.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'KEŞFET',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kahve Keyfi\nBaşlasın',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.brown[900],
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'En iyi kahve çeşitleri ve kahve dükkanları burada.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.brown[700],
                      ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'KEŞFET',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/coffee_getstarted.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kahve Keyfi\nBaşlasın',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.brown[900],
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 32),
                Text(
                  'En iyi kahve çeşitleri ve kahve dükkanları burada.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.brown[700],
                      ),
                ),
                const SizedBox(height: 64),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox(
                    width: 240,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'KEŞFET',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Image.asset(
            'assets/images/coffee_getstarted.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
