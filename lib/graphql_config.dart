import 'package:graphql_flutter/graphql_flutter.dart';

const graphQLEntryPoint =
    "${const String.fromEnvironment('SUPABASE_URL')}/graphql/v1";
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

class GraphQLConfig {
  static HttpLink httpLink = httpLink = HttpLink(
    graphQLEntryPoint,
    defaultHeaders: {
      "apiKey": supabaseKey,
      "Content-Type": "application/json",
    },
  );

  static GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );
}
