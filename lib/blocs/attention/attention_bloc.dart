import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/repositories/attent_repo.dart';
import 'package:ssg_app/models/Attention.dart';

part 'attention_event.dart';
part 'attention_state.dart';

class AttentionBloc extends Bloc<AttentionEvent, AttentionState> {
  final AttentRepository attentRepository;
  AttentionBloc({required  this.attentRepository}) : super(AttentionInitial()) {
    on<LoadAttention>((event, emit) async {
      final List<AttentionModel> data = await attentRepository.getData();
      emit(AttentionLoaded(data: data));
    });
  }
}
