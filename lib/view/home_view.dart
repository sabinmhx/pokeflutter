import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemon_app_graphql/graphql/models/pokemon.dart';
import 'package:pokemon_app_graphql/graphql/queries/queries.dart';
import 'package:pokemon_app_graphql/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int limit = 40;
  List<Pokemon> pokemons = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon App'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(Queries.pokemon),
          variables: <String, dynamic>{
            'first': limit,
          },
        ),
        builder: (QueryResult result, {refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Center(child: Text('Error: ${result.exception.toString()}'));
          }

          if (result.isLoading && pokemons.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.data != null && result.data!['pokemons'] != null) {
            List<dynamic> newData = result.data!['pokemons'] as List<dynamic>;
            if (newData.length > pokemons.length) {
              pokemons = newData.map((e) => Pokemon.fromJson(e)).toList();
              _isLoadingMore = false;
            }
          }

          if (pokemons.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: pokemons.length + 1,
            itemBuilder: (context, index) {
              if (index == pokemons.length) {
                return _buildLoadMoreIndicator(result.isLoading);
              }

              final pokemon = pokemons[index];
              return _buildPokemonCard(pokemon);
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadMoreIndicator(bool isLoading) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text('No more data to load'),
      ),
    );
  }

  Widget _buildPokemonCard(Pokemon pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailView(
              id: pokemon.id,
              image: pokemon.image,
              name: pokemon.name,
              classification: pokemon.classification,
              weight: pokemon.weight,
              height: pokemon.height,
            ),
          ),
        );
      },
      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: Image.network(
            pokemon.image,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        title: Text(
          pokemon.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.classification,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'ID: ${pokemon.id}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        trailing: Text('#${pokemon.number}'),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (!_isLoadingMore) {
      setState(() {
        _isLoadingMore = true;
        limit += 20;
      });
    }
  }
}
