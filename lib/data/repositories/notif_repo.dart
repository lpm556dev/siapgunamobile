import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ssg_app/models/Notif.dart';

class NotifRepository {
  final notificationPlugins = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  final List<NotifModel> _data = [
    NotifModel(
      id: '1',
      title: 'Pengingat Sholat',
      message: 'Waktunya sholat Dzuhur!',
      time: '12:00',
    ),
    NotifModel(
      id: '2',
      title: 'Mutaba\'ah Hari Ini',
      message: 'Jangan lupa isi laporan harian.',
      time: '08:30',
    ),
    NotifModel(
      id: '3',
      title: 'Update Berita',
      message: 'Ada berita baru dari komunitas.',
      time: '10:15',
    ),
  ];

  //init settings
  Future<void> initNotification() async {
    if (_isInitialized) return; //prevent re-init

    //android init
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_santri_siap_mobile',
    );

    //iOS init
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init settings
    final initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // final initialization
    await notificationPlugins.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        channelDescription: "channelDescription",
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? description,
  }) async {
    return notificationPlugins.show(
      id,
      title,
      description,
      notificationDetails(),
    );
  }

  Future<List<NotifModel>> fetchNotifications() async {
    await Future.delayed(Duration(milliseconds: 300)); // simulasi delay
    return _data;
  }

  // Tambahkan notifikasi baru
  Future<void> addNotification(NotifModel notif) async {
    await Future.delayed(Duration(milliseconds: 200)); // simulasi delay
    this.showNotification(
      id: int.parse(notif.id),
      title: notif.title,
      description: notif.message,
    );
    _data.add(notif);
  }

  // Hapus notifikasi
  Future<void> removeNotification(String id) async {
    _data.removeWhere((element) => element.id == id);
  }
}
