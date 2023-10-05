part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class GetPopularMoviesEvent extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  @override
  List<Object> get props => [];
}
