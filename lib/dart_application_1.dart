import 'dart:math';

const globalConst = 'G';
enum Weather { cloudy, sunny, rainy, snowy }
const globalNumList = [1, 2, 3, 4, 5];
const paragraphOfText = 'Once upon a time there was a Dart programmer who '
    'had a challenging challenge to solve. Though the challenge was great, '
    'a solution did come. The end.';
void main() {
  print('hello world');

  int a = 1;
  double b = 2.0;
  num c = a + b;
  print(c);

  String d = 'What\'s up';
  String e = '\u2665';
  String emoji = '\u{1f600}';
  print(d + e + emoji);
  print(d.codeUnits);

  print('c is $c');
  print('d is $d');

  final message = StringBuffer();
  message.write('Start Here');
  print(message);
  message.write(' Test StringBuffer');
  print(message);

  print('${((123 + 123) * 1.5).toStringAsFixed(0)}');

  Object ob;
  ob = 32;
  print(ob);
  ob = 'test object type';
  print(ob);

  double percentage;
  percentage = (90 * 0.2) + (80 * 0.3) + (94 * 0.5);
  print(percentage.toInt());

  const vote = 'Thumbs up! 👍🏿';
  print(vote.codeUnits.length);
  print(vote.runes.length);
  //print(vote.characters.length); need dependency

  const reader = 'TheOusama';
  const author = 'GodEye';
  const authorEqualtoReader = reader == author;
  print('authorEqualtoReader is $authorEqualtoReader');

  //scope
  const local = 'local';
  if (true) {
    const insideIf = 'Inside If';
    print(local);
    print('$globalConst is global');
    print(insideIf);
  }
  print(local);
  print('$globalConst is global');
  //print(insideIf); //not allowed

  const myAge = 23;
  var answer = (myAge > 13 || myAge < 19) ? 'Teenager' : 'Not a Teenager';
  print('TheOusama is $answer');

  //enum
  const weatherToday = Weather.rainy;
  switch (weatherToday) {
    case Weather.cloudy:
      print('Weather is cloudy');
      break;
    case Weather.sunny:
      print('Weather is sunny');
      break;
    case Weather.snowy:
      print('Weather is snowy');
      break;
    default:
      print(weatherToday.index);
  }

  //do-while
  int sum = 1;
  do {
    print(sum);
    sum += 3;
  } while (sum > 10);

  //while
  while (true) {
    sum += 4;
    if (sum > 10) {
      break;
    }
    print(sum);
  }

  //dart:match , Random();
  final random = Random();
  while (random.nextInt(6) + 1 != 6) {
    print('Not a Six!');
  }
  print('Congraduation! It\'s a Six.');

  //forEach loop
  globalNumList.forEach((index) => print(index));

  const numbers = [1, 2, 4, 7];

  for (var square in numbers) {
    print('Square of $square is ${square * square}');
  }

  numbers.forEach((index) => print('${index * index}'));

  const number = 946;
  var trial = 1;
  var times = 0;
  while (trial < number) {
    trial = trial * 2;
    times += 1;
  }
  print('Next power of 2 >= $number is $trial '
      'which is 2 to the power of $times.');

  //optional parameters []
  //named parameters ex: {int min=0,int max=10}
  /**'required' keyword to make parameter must need to input
   * 
   * 
   * 
  */
  String youAreWonderful({required String name, int number = 30}) {
    return 'You\'re wonderful,$name.$number people think so';
  }

  print(youAreWonderful(name: 'GOD', number: 10));

  final password = Password('1234');

  print(password.isValid());

  final sphere = Sphere(radius: 12);
  final volume = sphere.volume;
  final surface = sphere.surface;
  print(
      'Volume is ${volume.toStringAsFixed(3)} & Surface is ${surface.toStringAsFixed(3)}');

  //null_aware operators
  /**
  *If-null operator (??)
  *Null-aware assignment operator (??=) 
  fontSize= fontSize ?? 20.0;
  fontSize??=20.0;
  *Null-aware access operator (?.)
  *Null-aware method invocation operator (?.)
  num?.isNegative;
  num?.toDouble();
  *Null assertion operator (!)
  *Null-aware cascade operator (?..)
   user
   ?..name='Ray';
   ..age=20;
  *Null-aware index operator (?[])
  *Null-aware spread operator (...?)
  */

  //late
  //late means that Dart doesn’t initialize the variable
  //right away. It only initializes it when you access it the first
  //time.

  /*int? randomNothing() {
    final isTrue = Random().nextBool();
    return (isTrue) ? 42 : null;
  }

  final result = randomNothing() ?? 0;
  print(result);*/

  //Collection
  /**List
   * spread operator (...) to expand those lists into another lists
   * null-spread operator (...?) to omit a list if it's null
   * 
   * Set
   * .contains() to check item that contain or not in set which return Bool
   * .addAll() to elemenst from a list to a set
   * .intersection()
   * .union()
   * 
   * Map
   * .remove('key');
   * .keys to access only Keys
   * .values to access only Values
   * .containsKey('key') to check whether a key is in a map
   * .containsValue(23)
   * 
   * .toSet()
   * .toList()
   * 
   * Higher Order Methods
   * map,where,
   * reduce,fold, 
   * sort
   * 
   * .reversed
   * 
   * 
  */
  final myInfo = {
    'name': 'GODEYE',
    'profession': 'nothing',
    'country': 'MM',
    'city': 'YGN',
  };
  myInfo['country'] = 'Toronto';
  myInfo['city'] = 'Canada';
  for (final info in myInfo.values) {
    print(info);
  }

  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  scores.sort();
  print(scores);
  final bGrade = scores.where((score) => score >= 80 && score <= 90);
  print(bGrade.toList());

  Set<String> uniqueCodePoints(String text) {
    return text.runes
        .map((codePoint) => String.fromCharCode(codePoint))
        .toSet();
  }

  print(uniqueCodePoints(paragraphOfText));

  final users = [
    User(1, 'John'),
    User(2, 'May'),
    User(3, 'Bob'),
  ];

  List<Map<String, Object>>? userToMapList(List<User> users) {
    final userMapList = <Map<String, Object>>[];
    for (var user in users) {
      final userMap = {
        'id': user.id,
        'name': user.name,
      };
      userMapList.add(userMap);
      return userMapList;
    }
    return null;
  }

  print(userToMapList(users));

  final fruit1 = Fruit('Red');
  fruit1.describedColor();
  final waterMelon = Watermelon('yellow');
  waterMelon.describedColor();
}

/// class
///
/// final , const, static, factory
/// static const
/// get , set (getter,setter)
class Password {
  final String value;

  const Password(this.value);

  @override
  String toString() {
    return 'Password is $value';
  }

  bool isValid() => value.length > 8;
}

//Singleton Class Pattern
class MySingleton {
  MySingleton._();
  static final MySingleton _instance = MySingleton._();

  factory MySingleton() => _instance;
}

class Sphere {
  const Sphere({required int radius})
      : assert(radius > 0),
        _radius = radius;

  final int _radius;
  static const double pi = 3.14159265359;
  double get volume => 4 / 3 * pi * (3 * _radius);
  double get surface => 4 * pi * (2 * _radius);
}

class User {
  User(this.id, this.name);
  final int id;
  final String name;
}

class Fruit {
  Fruit(this.color);
  String color;
  void describedColor() {
    print('Fruit color is $color');
  }
}

class Melon extends Fruit {
  Melon(String color) : super(color);
}

class Watermelon extends Melon {
  Watermelon(String color) : super(color);

  @override
  void describedColor() {
    print('This is describedColor of Watermelon $color');
    //super.describedColor();
  }
}

class Cantaloupe extends Melon {
  Cantaloupe(String color) : super(color);
}
