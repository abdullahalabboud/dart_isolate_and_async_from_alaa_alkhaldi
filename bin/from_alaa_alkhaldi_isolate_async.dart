// importing alaa isolate dart file
import 'package:from_alaa_alkhaldi_isolate_async/alaa_async.dart';
// importing alaa async dart file
import 'package:from_alaa_alkhaldi_isolate_async/isolate_alaa.dart';

void main(List<String> arguments) {
  // using dart isolate...
  alaaIsolateFunction().then((result) => print(result));

  // using dart async ...
  alaaAsyncFunction();
}
