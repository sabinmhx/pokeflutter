import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiService {
  static ValueNotifier<GraphQLClient> createClient() {
    final httpLink = HttpLink(
      'https://graphql-pokemon2.vercel.app',
      defaultHeaders: {
        'Content-Type': 'application/json',
      },
    );

    return ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );
  }
}
