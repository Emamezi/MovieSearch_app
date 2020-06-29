import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view/movie_list_page.dart';
import './viewmodels/movie_listview_model.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieListViewModel(),
      child: MaterialApp(
        home: MovieListPage(),
      ),
    );
  }
}
