import 'dart:io';

void task1() {
  Duration time = Duration(seconds: 6);
  sleep(time);
  print("Hello World 1");
}

Future<String> task2() async {
  String result = '';
  Duration time = Duration(seconds: 3);
  await Future.delayed(time, () {
    result = "Hello World 2";
    print("Hello World 2");
  });
  return result;
}

void task3(String message) {
  Duration time = Duration(seconds: 1);
  sleep(time);
  print("Hello World with message: $message");
}

void performTasks() async {
  task1();
  String data2 = await task2();
  task3(data2);
}

void main(List<String> args) {
  performTasks();
}
