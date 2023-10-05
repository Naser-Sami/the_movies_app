import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';
import '../../../movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_onGetNowPlayingMoviesEvent);
    on<GetPopularMoviesEvent>(_onGetPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_onGetTopRatedMoviesEvent);
  }

  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;


  FutureOr<void> _onGetNowPlayingMoviesEvent(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoP());

    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingRequestState: RequestState.Error,
          nowPlayingMessage: l.message,)),
      (r) => emit(state.copyWith(
        nowPlayingRequestState: RequestState.Loaded,
        nowPlayingMovies: r,
      )),
    );
  }

  FutureOr<void> _onGetPopularMoviesEvent(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoP());

    result.fold(
      (l) => emit(state.copyWith(
        popularRequestState: RequestState.Error,
        popularMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        popularRequestState: RequestState.Loaded,
        popularMovies: r,
      )),
    );
  }

  FutureOr<void> _onGetTopRatedMoviesEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoP());

    result.fold(
      (l) => emit(state.copyWith(
        topRatedRequestState: RequestState.Error,
        topRatedMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        topRatedRequestState: RequestState.Loaded,
        topRatedMovies: r,
      )),
    );
  }
}
