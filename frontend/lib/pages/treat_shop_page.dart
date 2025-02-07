import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'components/hamburger_menu.dart';

class TreatShopPage extends StatefulWidget {
  const TreatShopPage({super.key});

  @override
  State<TreatShopPage> createState() => _TreatShopPageState();
}

class _TreatShopPageState extends State<TreatShopPage> {
  static const String getTreatsQuery = r'''
    query GetTreats {
      treats {
        treatID
        treatDescription
      }
    }
  ''';

  void _fetchTreats() async {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    final QueryResult result = await client.query(
      QueryOptions(
        document: gql(getTreatsQuery),
      ),
    );

    if (result.hasException) {
      print(result.exception.toString());
      return;
    }

    if (result.data != null) {
      // Handle your data here
      print(result.data!['treats']);
    }
  }

  Future<void> _addTreat(String treatDescription) async {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    final MutationOptions options = MutationOptions(
      document: gql(addTreatMutation),
      variables: {"treatDescription": treatDescription},
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print("Error: ${result.exception.toString()}");
      return;
    }

    if (result.data != null) {
      print("Added Treat: ${result.data!['addTreat']}");
    }
  }

  static const String addTreatMutation = """
  mutation AddTreat(\$treatDescription: String!) {
    addTreat(treatDescription: \$treatDescription) {
      id
      description
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Treat Shop"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Tap Me!'),
              onPressed: _fetchTreats,
            ),
          ],
        ),
      ),
    );
  }
}
