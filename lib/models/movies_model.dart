import 'package:fmv/fmv.dart';

import '../repositories/movies_repository.dart';
import 'movie.dart';

class MoviesModel extends FAbstractItemModel {
  MoviesModel() : _data = MoviesRepository.instance.fetchMovies();

  final List<Movie> _data;

  @override
  int rowCount() => _data.length;

  @override
  int columnCount() => 5;

  @override
  headerData(int column, {FOrientation orientation = FOrientation.horizontal}) {
    switch (column) {
      case 0:
        return "ID";
      case 1:
        return "Title";
      case 2:
        return "Description";
      case 3:
        return "Cover";
      case 4:
        return "Rating";
      default:
        return "???";
    }
  }

  @override
  dynamic data(FModelIndex index) {
    if (!index.isValid()) return null;

    Movie data = _data[index.row!];

    switch (index.column!) {
      case 0:
        return data.id;
      case 1:
        return data.title;
      case 2:
        return data.description ?? "N/A";
      case 3:
        return data.imageURL ?? "";
      case 4:
        return data.rating != null ? "${data.rating}/5" : "N/A";
      default:
        return null;
    }
  }

  @override
  fetchMore() {
    _data.addAll(MoviesRepository.instance.fetchMovies(_data.length));
    return super.fetchMore();
  }
}
