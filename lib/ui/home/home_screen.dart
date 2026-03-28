import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/home/widgets/category_widget.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usando watch para reagir a mudanças nos dados
    final restaurantData = context.watch<RestaurantData>();

    return Scaffold(
      drawer: const Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Center(child: Image.asset("assets/logo.png", width: 147)),
              const SizedBox(height: 32.0),
              const Text(
                "Boas-vindas!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "O que você quer comer hoje?",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              const Text(
                "Escolha por categoria",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CategoryWidget(
                          category: CategoriesData.listCategories[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/banners/banner_promo.png"),
              ),
              const SizedBox(height: 32.0),
              const Text(
                "Bem avaliados",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16.0),
              // Lista de restaurantes
              ...List.generate(restaurantData.listRestaurant.length, (index) {
                Restaurant restaurant = restaurantData.listRestaurant[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: RestaurantWidget(restaurant: restaurant),
                );
              }),
              const SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
