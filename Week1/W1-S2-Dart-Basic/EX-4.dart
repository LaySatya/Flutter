// Write a program to calculate the total for a given order. 
void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple' , 'vegetarian' , 'apple'];

  // Your code
  double total = 0.0;
  for (int i = 0 ; i < order.length ; i++) {;
    var orderProduct = order[i];    // just declare to store the order of the product name
    // print(pizzaPrices[orderProduct]);
    if(pizzaPrices[orderProduct] != null){
      total += pizzaPrices[orderProduct]!;    // ! to ensure that the value is not null, if not put it then it will error
    }
    else{
      print('$orderProduct is not on the menu.');
      continue;
    }
  }

    // one way to loop and check the order and find the total price of order
    for (var product in order) {
      if (pizzaPrices.containsKey(product)) {
        total += pizzaPrices[product]!;
      } else {
        print('$product is not on the menu.');
      }
    }
  print("Total:  \$$total");    // \$ to show the $ 
}
