import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/blocs/notif/notif_bloc.dart';
import 'package:ssg_app/models/Notif.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';

class TestAlert extends StatefulWidget {
  final int id;
  const TestAlert({super.key, required this.id});

  @override
  State<TestAlert> createState() => _TestAlertState();
}

class _TestAlertState extends State<TestAlert> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Type something to test notifications!'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  icon: Icon(Icons.message),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel", style: AppTextStyle.buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => AppColors.dangerColor,
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Send"),
          onPressed: () {
            final NotifModel newData = NotifModel(
              id: widget.id.toString(),
              title: _titleController.text,
              message: _messageController.text,
              time: DateTime.now().toString(),
            );
            debugPrint(newData.id);
            context.read<NotifBloc>().add(AddNotif(data: newData));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
