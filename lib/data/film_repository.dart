import 'package:flutter_graphql_demo/domain/film.dart';
import 'package:flutter_graphql_demo/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'queries.dart';

class FilmRepository {
  final GraphQLClient _client = GraphQLConfig.client;
  final String _filmsQuery = getAllFilmsQuery;

  Future<List<Film>> getFilmsData(
      // String id
      ) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(_filmsQuery),
        // variables: {'id': id},
      );

      final QueryResult result = await _client.query(options);
      final data = result.data?['filmCollection']['edges'] as List?;

      if (data == null || result.hasException) {
        throw Exception(result.exception.toString());
      }

      final parsedData = (data).map<Film>((node) {
        return Film.fromJson(node['node']);
      }).toList();

      return parsedData;
    } catch (e) {
      rethrow;
    }
  }

  Future<Film> upsertFilm(Film film, bool isUpdate) async {
    try {
      MutationOptions options;
      if (isUpdate) {
        options = MutationOptions(
          document: gql(updateFilmMutation(film)),
        );
      } else {
        options = MutationOptions(
          document: gql(insertFilmMutation(film)),
        );
      }

      final QueryResult result = await _client.mutate(options);

      Map<String, dynamic> data;
      if (isUpdate) {
        data = (result.data!['updateFilmCollection']['records'] as List).first;
      } else {
        data =
            (result.data?['insertIntoFilmCollection']['records'] as List).first;
      }

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      return Film.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Film> deleteFilm(String id) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(deleteFilmMutation(id)),
      );

      final QueryResult result = await _client.mutate(options);

      final data = result.data?['deleteFromFilmCollection']['records'].first;

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      return Film.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
