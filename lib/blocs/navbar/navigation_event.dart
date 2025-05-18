part of 'navigation_bloc.dart';

sealed class NavigationEvent {
  final int index;
  const NavigationEvent({required this.index});
}

final class ChangeTab extends NavigationEvent {
  const ChangeTab({required super.index});
}
