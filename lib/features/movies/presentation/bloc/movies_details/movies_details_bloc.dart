import 'dart:async';

import 'package:bloc/bloc.dart';
import '/core/core.dart';
import '/features/movies/domain/domain.dart';
import 'package:equatable/equatable.dart';

import 'movies_details_state.dart';

part 'movies_details_event.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(
      this.getMovieDetailsUsecase, this.getRecommendationMoviesUsecase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;

  FutureOr<void> _getMovieDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsP(movieId: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        moviesDetailsRequestState: RequestState.Error,
        moviesDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          moviesDetailsRequestState: RequestState.Loaded,
          moviesDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result =
        await getRecommendationMoviesUsecase(RecommendationP(id: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.Error,
        recommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendationState: RequestState.Loaded,
          recommendations: r,
        ),
      ),
    );
  }
}
