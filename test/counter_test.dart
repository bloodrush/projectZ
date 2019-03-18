
import "package:test/test.dart";


import '../lib//widgets//Counter.dart';



void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}