// import 'package:bloc/bloc.dart';
// import 'package:ssg_app/models/Task.dart';
// import 'package:ssg_app/data/repositories/task_repo.dart';

// part 'task_event.dart';
// part 'task_state.dart';

// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   final TaskRepository repository;

//   TaskBloc({required this.repository}) : super(TaskInitial()) {
//     on<LoadTasks>((event, emit) async {
//       final data = await repository.getAllTasks();
//       // final isError = false;
//       // final String errorMessage = "Error";
//       if (data.length != 0) {
//         emit(TaskLoaded(data));
//         // } else if (isError) {
//         //   emit(TaskError(errorMessage));
//       } else {
//         emit(TaskEmpty());
//       }
//     });
//     on<ChangeStatus>((event, emit) async {
//       await repository.updateTask(event.task);
//       final data = await repository.getAllTasks();
//       if (data.isEmpty) {
//         emit(TaskEmpty());
//       } else {
//         emit(TaskLoaded(data));
//       }
//     });

//     on<RemoveTask>((event, emit) async {
//       await repository.deleteTask(int.parse(event.id));
//       final data = await repository.getAllTasks();
//       if (data.isEmpty) {
//         emit(TaskEmpty());
//       } else {
//         emit(TaskLoaded(data));
//       }
//     });

//     on<AddTask>((event, emit) async {
//       await repository.addTask(event.task);
//       final data = await repository.getAllTasks();
//       if (data.isEmpty) {
//         emit(TaskEmpty());
//       } else {
//         emit(TaskLoaded(data));
//       }
//     });
//   }
// }
