import 'package:ssg_app/models/Attention.dart';

class AttentRepository {
  final List<AttentionModel> _data = [
    AttentionModel(
      id: "1",
      title: "Kerja Bakti Sosial",
      subtitle: "Kegiatan bakti sosial di masjid agung sumedang.",
      tgl: DateTime.now(),
    ),
    AttentionModel(
      id: "1",
      title: "Kerja Bakti Sosial",
      subtitle: "Kegiatan bakti sosial di masjid agung sumedang.",
      tgl: DateTime.now(),
    ),
  ];

  Future<List<AttentionModel>> getData() {
    return Future.value(_data);
  }
}
