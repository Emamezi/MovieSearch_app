import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class WebService {
  Future<List<Movie>> getMovie(String keyword) async {
    final url = 'http://www.omdbapi.com/?s=$keyword&apikey=5309b829';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJSON(movie)).toList();
    } else
      throw Exception('Unable to perform request');
  }
}
