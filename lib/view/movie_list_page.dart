import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/movie_listview_model.dart';
import 'package:movie_app/widgets/movie_list.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieSearch = Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Movies App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Colors.black26,
                    filled: true,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  showCursor: false,
                  controller: _controller,
                  onSubmitted: (typedMovieName) {
                    if (typedMovieName.isNotEmpty) {
                      movieSearch.fetchMovies(typedMovieName);
                      _controller.clear();
                    }
                  },
                ),
              ),
            ),
            MovieList(),
          ],
        ),
      ),
    );
  }
}
