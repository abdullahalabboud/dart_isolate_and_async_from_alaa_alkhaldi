import 'dart:async';

Stream<int> generateStream1() async* {
  while (true) {
    // delay 1 second for stream 1
    await Future.delayed(Duration(seconds: 1));
    // send time at now as millisocond
    yield DateTime.now().millisecondsSinceEpoch;
  }
}

Stream<int> generateStream2() async* {
  while (true) {
    // delay 2 seconds for stream 2
    await Future.delayed(Duration(seconds: 2));
    // send time at now as millisocond
    yield DateTime.now().millisecondsSinceEpoch;
  }
}

void alaaAsyncFunction() {
  // define stream controllers
  StreamController<int> controller1 = StreamController<int>();
  StreamController<int> controller2 = StreamController<int>();

  // listren to steamer 1
  controller1.stream.listen((data) {
    print('Data from stream 1: $data');
  });

  // listren to steamer 2
  controller2.stream.listen((data) {
    print('Data from stream 2: $data');
  });

  // add time.now to the streamer 1
  generateStream1().listen((data) {
    controller1.sink.add(data);
  });

  // add time.now to the streamer 2
  generateStream2().listen((data) {
    controller2.sink.add(data);
  });
}
