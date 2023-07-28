import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../pages/home_page.dart';

class FetchMoreWidget extends StatelessWidget {
  const FetchMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpLink = HttpLink(
      'https://graphql-pokemon2.vercel.app',
      defaultHeaders: {
        'Content-Types': 'application/json',
      },
    );

    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: const CacheProvider(
        child: HomePage(title: 'Pokémon'),
      ),
    );
  }
}
