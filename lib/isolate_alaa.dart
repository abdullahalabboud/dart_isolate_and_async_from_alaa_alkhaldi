import 'dart:isolate';

void generateStream1(SendPort sendPort) async {
  while (true) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    sendPort.send(DateTime.now().millisecondsSinceEpoch);
  }
}

void generateStream2(SendPort sendPort) async {
  while (true) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    sendPort.send(DateTime.now().millisecondsSinceEpoch);
  }
}

Future<String> alaaIsolateFunction() async {
  final receivePort1 = ReceivePort();
  final receivePort2 = ReceivePort();

  await Isolate.spawn(generateStream1, receivePort1.sendPort);
  await Isolate.spawn(generateStream2, receivePort2.sendPort);

  // receive sending date now from generateStream1() function
  receivePort1.listen((data) {
    print("data from generate steam 1 : $data");
  });
  // receive sending date now from generateStream2() function
  receivePort2.listen((data) {
    print("data from generate steam 2 : $data");
  });
  return 'asynFucntion result';
}
