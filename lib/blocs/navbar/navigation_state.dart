part of 'navigation_bloc.dart';

sealed class NavigationState {
  final int tabIndex;
  const NavigationState({required this.tabIndex});
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.tabIndex});
}