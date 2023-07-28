import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String classification;
  final Map<String, dynamic> weight;
  final Map<String, dynamic> height;
  const DetailPage({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.classification,
    required this.weight,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémon Details')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.network(image),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                classification,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ID: $id',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'Weight:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '----------------',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('Minimum: ${weight["minimum"]}'),
                          Text('Maximum: ${weight["maximum"]}'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'Height:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '----------------',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('Minimum: ${height["minimum"]}'),
                          Text('Maximum: ${height["maximum"]}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
