import 'package:flutter/foundation.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/webservice.dart';

class MovieListViewModel with ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();
  Future<void> fetchMovies(String keyword) async {
    final result = await WebService().getMovie(keyword);
    this.movies = result.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;
  MovieViewModel({this.movie});

  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }
}
