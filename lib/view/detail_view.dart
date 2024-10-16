import 'package:flutter/material.dart';
import 'package:pokemon_app_graphql/graphql/models/pokemon.dart';

class DetailView extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String classification;
  final Anatomy weight;
  final Anatomy height;

  const DetailView({
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
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        shrinkWrap: true,
        children: [
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Center(
            child: Text(
              classification,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          Center(
            child: Text(
              'ID: $id',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('Weight', weight, context),
              _buildStatCard('Height', height, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, Anatomy anatomy, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '$title:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '----------------',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey),
            ),
            Text('Minimum: ${anatomy.minimum}'),
            Text('Maximum: ${anatomy.maximum}'),
          ],
        ),
      ),
    );
  }
}
