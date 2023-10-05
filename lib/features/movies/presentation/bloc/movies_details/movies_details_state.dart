
import '/core/core.dart';
import 'package:equatable/equatable.dart';

import '../../../movie.dart';

class MoviesDetailsState extends Equatable {
  const MoviesDetailsState({
    this.moviesDetails,
    this.moviesDetailsRequestState = RequestState.Loading,
    this.moviesDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationState = RequestState.Loading,
    this.recommendationMessage = '',
  });

  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsRequestState;
  final String moviesDetailsMessage;
  final List<Recommendation> recommendations;
  final RequestState recommendationState;
  final String recommendationMessage;

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? moviesDetailsRequestState,
    String? moviesDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsRequestState: moviesDetailsRequestState ?? this.moviesDetailsRequestState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
      recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    moviesDetails,
    moviesDetailsRequestState,
    moviesDetailsMessage,
    recommendations,
    recommendationState,
    recommendationMessage,
  ];
}