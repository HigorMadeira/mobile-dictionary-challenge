part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.home() = _Home;
  const factory NavigationState.history() = _History;
  const factory NavigationState.favorites() = Favorites;
}
