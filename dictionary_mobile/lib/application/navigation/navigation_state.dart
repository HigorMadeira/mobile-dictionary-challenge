part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.home() = _home;
  const factory NavigationState.history() = _history;
  const factory NavigationState.favorites() = favorites;
}
