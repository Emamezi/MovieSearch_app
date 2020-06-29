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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  // labelStyle: TextStyle(
                  //   color: Theme.of(context).textTheme.headline1.color,
                  // ),
                ),
                controller: _controller,
                onSubmitted: (typedMovieName) {
                  if (typedMovieName.isNotEmpty) {
                    movieSearch.fetchMovies(typedMovieName);
                    _controller.clear();
                  }
                },
              ),
              MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}
