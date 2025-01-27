import 'package:api_practice02/data/model/multiple_food_page.dart';
import 'package:api_practice02/data/repository/api_service.dart';
import 'package:flutter/material.dart';

class MultipleFoodScreen extends StatefulWidget {
  const MultipleFoodScreen({super.key});

  @override
  State<MultipleFoodScreen> createState() => _MultipleFoodScreenState();
}

class _MultipleFoodScreenState extends State<MultipleFoodScreen> {
  late Future<MultipleFood> fetchMultiplefood;
  @override
  void initState() {
    super.initState();
    fetchMultiplefood = ApiService().fetchMultiplefood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Multiple Food Item',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<MultipleFood>(
        future: fetchMultiplefood,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            MultipleFood multipleFood = snapshot.data!;
            return ListView.builder(
              itemCount: multipleFood.meals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            multipleFood.meals[index]['strMealThumb']!,
                            fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            multipleFood.meals[index]['strMeal']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            multipleFood.meals[index]['strCategory']!,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            multipleFood.meals[index]['strArea']!,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.black54),
                            ),
                            child: Text(
                              'deatils',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
