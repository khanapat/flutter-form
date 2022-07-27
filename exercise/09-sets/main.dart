void main() {
  const a = {1, 3};
  const b = {3, 5};

  var dif = a.difference(b);
  print(dif);

  var intersection = a.intersection(b);
  print(intersection);

  var union = a.union(b);
  print(union);

  var output = union.difference(intersection);
  print(output);

  int sum = 0;
  for (var i = 0; i < output.length; i++) {
    sum += output.toList()[i];
  }
  print(sum);
}
