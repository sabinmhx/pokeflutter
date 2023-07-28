import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/queries.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int limit = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Query(
              options: QueryOptions(
                document: gql(queries),
                variables: <String, dynamic>{
                  'first': limit,
                },
                //pollInterval: 10,
              ),
              builder: (QueryResult result, {refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading && result.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (result.data == null && !result.hasException) {
                  return const Text('Exception');
                }

                // result.data can be either a [List<dynamic>] or a [Map<String, dynamic>]
                final repositories =
                    (result.data!['pokemons'] as List<dynamic>);

                return Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      for (var repository in repositories)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailPage(
                                      id: repository['id'] as String,
                                      image: repository['image'] as String,
                                      name: repository['name'] as String,
                                      classification:
                                          repository['classification']
                                              as String,
                                      weight: repository['weight']
                                          as Map<String, dynamic>,
                                      height: repository['height']
                                          as Map<String, dynamic>,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 50,
                                    child: Image.network(
                                      repository['image'] as String,
                                    ),
                                  ),
                                  title: Text(
                                    repository['name'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        repository['classification'] as String,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'ID: ${repository['id'] as String}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    '#${repository['number'] as String}',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            limit = limit + 20;
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Load More'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
