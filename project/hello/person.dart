class Person {
  String name = '';
  int age = 0;


  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }
  Person({this.name = '', this.age = 0});
  Person.trust()
    : this.name = "trust",
      this.age = 24;

}

class Customer extends Person {
  double salary = 0.0;
}

void main() {
  // final x = Person('Bond', 18);
  final x = Person(name: 'Bond', age: 17);
  print(x.name);
  print(x.age);

  final y = Person.trust();
  print(y.name);
  print(y.age);


  // extension
  final a = Customer();
  print(a.age);
}