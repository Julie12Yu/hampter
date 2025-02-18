import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'components/hamburger_menu.dart';

class TreatQueries {
  static const String getTreats = r'''
    query GetTreats {
      treats {
        treatID
        treatDescription
      }
    }
  ''';

  static const String addTreat = """
    mutation AddTreat(\$treatDescription: String!) {
      addTreat(treatDescription: \$treatDescription) {
        id
        description
      }
    }
  """;
}

class Treat {
  final String id;
  final String description;

  Treat({required this.id, required this.description});

  factory Treat.fromJson(Map<String, dynamic> json) {
    return Treat(
      id: json['treatID'] ?? '',
      description: json['treatDescription'] ?? '',
    );
  }
}

class TreatShopPage extends StatefulWidget {
  const TreatShopPage({super.key});

  @override
  State<TreatShopPage> createState() => _TreatShopPageState();
}

class _TreatShopPageState extends State<TreatShopPage> {
  List<Treat> treats = [];

  Future<void> _fetchTreats() async {
    try {
      final client = GraphQLProvider.of(context).value;

      int retryCount = 0;
      const maxRetries = 3;

      while (retryCount < maxRetries) {
        try {
          final result = await client.query(
            QueryOptions(
              document: gql(TreatQueries.getTreats),
              fetchPolicy: FetchPolicy.networkOnly,
            ),
          );

          if (result.hasException) {
            if (retryCount < maxRetries - 1) {
              retryCount++;
              await Future.delayed(Duration(seconds: 1 * retryCount));
              continue;
            }
            throw Exception(result.exception.toString());
          }

          if (result.data != null) {
            final treatsList = (result.data!['treats'] as List)
                .map((treat) => Treat.fromJson(treat))
                .toList();
            setState(() {
              treats = treatsList;
            });
            break;
          }
        } catch (e) {
          if (retryCount >= maxRetries - 1) throw e;
          retryCount++;
          await Future.delayed(Duration(seconds: 1 * retryCount));
        }
      }
    } catch (e) {
      print('Error after retries: ${e.toString()}');
    }
  }

  Future<void> _addTreat(String treatDescription) async {
    try {
      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(TreatQueries.addTreat),
          variables: {"treatDescription": treatDescription},
        ),
      );

      if (result.hasException) {
        throw Exception('Error adding treat: ${result.exception.toString()}');
      }

      if (result.data != null) {
        await _fetchTreats();
      }
    } catch (e) {
      print('Error adding treat: ${e.toString()}');
    }
  }

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
              onPressed: _fetchTreats,
              child: const Text('Get Treats'),
            ),
          ],
        ),
      ),
    );
  }
}
