import 'package:equatable/equatable.dart';

class CalendarState extends Equatable {
  final DateTime? tanggal;

  const CalendarState({this.tanggal});

  CalendarState copyWith({DateTime? tanggal}) {
    return CalendarState(
      tanggal: tanggal ?? this.tanggal,
    );
  }

  @override
  List<Object?> get props => [tanggal];
}