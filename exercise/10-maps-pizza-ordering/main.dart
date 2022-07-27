void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const order = ['margherita', 'pepperoni', 'vegetarian', 'bobo'];
  double total = 0;

  for (var item in order) {
    if (pizzaPrices.containsKey(item)) {
      total += pizzaPrices[item]!;
    } else {
      print('${item} pizza is not on the menu');
    }
  }
  print('Total: \$${total}');
}
