void main() {
  // การสร้างตัวแปร
  // const -> performance ดีสุด ทำตอน compile time แก้ไขค่าตอน runtime ไม่ได้
  // final -> คล้าย let แก้ไขค่าตอน runtime ได้
  // var -> 
  var name = 'lol';
  final String nickname = 'trust';
  final int age = 20;
  print('my name is $nickname age ${age + 2}');

  // function
  String title = 'Dart course';
  print(title);

  title = title.toUpperCase();
  print(title);

  var titleup = 'Hello'.toUpperCase();
  print(titleup);
  // if
  var ten = 10;
  if (ten >= 10) {
    print('above or equal 10');
  } else {
    print('below 10');
  }

  // nil
  int? err;
  print(err);

  // list
  var lista = [1, 2, 3, 4];
  var listb = ["a","b","c"];
  var listc = [1,2,"a","b"];
  var listd = <int>[1,2,3];
  //// correction if
  var isOk = false;
  var listisOk = [1,2,3,"a", if(isOk) "bobo"];
  print(listisOk);
  //// correction for
  var y = [5,6];
  var listforOk = [1,2,3,"a", for(var z in y) z];
  print(listforOk);
  //// concat
  var listconcat = [1,2,3,"a", ...y];
  print(listconcat);
  
  // map
  var mapa = {"th":"Thailand","en":"English","bobo":0};
  var mapb = <String,String>{"th":"Thailand","en":"English"};
  print(mapa["th"]);
  
  for (var item in mapa.entries) {
    print(item.value);
  }

  // parse
  int toggle = 10;
  int? parsex;
  if (toggle < 10) {
    parsex = 10;
  }
  // int parsey = parsex ?? 0;
  int parsey = parsex == null ? 0 : toggle;
  print(parsey);

  // handle type
  var list = ["hello", "world", 10];


  // function closure
  var sayHi = (name) => 'Hello $name';
  var result = sayHi('trust');
  print(result);

  var resultset = cal(20, 10, (a,b) => a+b);
  print(resultset);

  var ex = [1,2,3];
  var ey = ex.map((e) => e * 2);
  print(ey);

  print(hello(name: 'trust'));
  print(hello(name: 'trust', age: 24));
  print(requiredhello(name: 'bobo', age: 24));
}

// int add(int a, int b) => a + b;
// int sub(int a, int b) => a - b;
typedef MathFunc = int Function(int, int);
// int cal(int a, int b, int Function(int, int) func) => func(a, b)
int cal(int a, int b , MathFunc func) => func(a, b);

String hello({String? name, int? age, int birth = 0}) {
  return 'My name is $name age $age birth $birth';
}

String requiredhello({required String name, required int age}) {
  return 'My name is $name age $age';
}