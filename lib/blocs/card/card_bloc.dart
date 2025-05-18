import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardLoaded(null, null)) {
    on<LoadCardData>((event, emit) async {
      try {
        Map<String, dynamic>? qrCodeData;
        
        try {
          qrCodeData = await UserRepository.getQrCode();
          if (qrCodeData['data'] != null) {
            await UserRepository.setSession("qrCode", qrCodeData['data']);
          }else{
            throw Exception("No QR code data found");
          }
        } catch (e) {
          qrCodeData = await UserRepository.getString("qrCode") as Map<String, dynamic>?;
        }

        final userName = await UserRepository.getString("username");
        
        if (qrCodeData != null && qrCodeData['data'] != null) {
          emit(CardLoaded(qrCodeData, userName));
        } else {
          throw Exception("No QR code data found");
        }
      } catch (e) {
        emit(CardError("Error loading QR code: ${e.toString()}"));
      }
    });
  }
}
