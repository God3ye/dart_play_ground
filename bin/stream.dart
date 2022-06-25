Future<void> main(List<String> args) async {
  final myPeriodicStream = Stream.periodic(Duration(seconds: 1));
  final subscription = myPeriodicStream.listen((event) {
    print('Dic Dok!');
  });
  await Future.delayed(Duration(seconds: 3));
  await subscription.cancel();
  firstStream().map((msg) => msg.toUpperCase()).listen(
    (event) {
      print(event);
    },
  );
}

Stream<String> firstStream() async* {
  yield 'hello';
  await Future.delayed(Duration(seconds: 2));
  yield 'do u know Stream';
  await Future.delayed(Duration(seconds: 2));
  yield 'It\'s cool!';
}
