# Exercise: Shopping List

Given the following program:

```dart
void main() {
  const bananas = 5;
  const apples = 6;
  const grains = {
    'pasta': '500g',
    'rice': '1kg',
  };
  const addGrains = true;
  var shoppingList = {
    if (bananas > 0) 'bananas' = bananas;
    if (apples > 0) 'apples' = apples;
    if (addGrains > 0) ...grains;
  };
  print(shoppingList);
  // prints {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
}
```

Rewrite this code so that the `shoppingList` variable is initialized using **collection-if**, **collection-for** or **spreads**, and the program output is the same.




