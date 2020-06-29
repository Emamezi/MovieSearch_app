import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/movie_listview_model.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieRequest = Provider.of<MovieListViewModel>(context);
    final movies = movieRequest.movies;
    return Expanded(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
            // ModalRoute.of(context).settings.arguments as id
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  movies[i].poster,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  movies[i].title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
