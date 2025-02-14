import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    'http://localhost:8080/graphql', // FLAG FOR FIX IF WRONG TODO IN PROGRESS FIX PLEASE
  );

  static final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );
}
