// const String getAllFilmsQuery = r'''
//   query Query {
//     allFilms {
//       films {
//         title
//         director
//         releaseDate
//         speciesConnection {
//           species {
//             name
//             classification
//             homeworld {
//               name
//             }
//           }
//         }
//       }
//     }
//   }
// ''';

import 'package:flutter_graphql_demo/domain/film.dart';

const String getAllFilmsQuery = '''
  query Query {
    filmCollection {
      edges {
        node {
          id
          title
          director
          releaseDate
        }
      }
    }
  }
''';

String updateFilmMutation(Film film) => '''
  mutation {
    updateFilmCollection (
      set: {
        id: "${film.id}",
        title: "${film.title}",
        director: "${film.director}",
        releaseDate: "${film.releaseDate}"
      }
    ) {
      affectedCount
      records {
        id,
        title
        director
        releaseDate
      }
    }
  }
''';

String insertFilmMutation(Film film) => '''
  mutation {
    insertIntoFilmCollection
    (
      objects: [{
        title: "${film.title}", 
        director: "${film.director}",
        releaseDate: "${film.releaseDate}"
        }
      ]
    ) {
      affectedCount
      records {
        id
        title
        director
        releaseDate
      }
    }
  }
''';

String deleteFilmMutation(String id) => '''
  mutation {
    deleteFromFilmCollection
    (
      filter: {
        id: {eq: "$id"}
      }
    ) {
      affectedCount
      records {
        id
        title
        director
        releaseDate
      }
    }
  }
''';
