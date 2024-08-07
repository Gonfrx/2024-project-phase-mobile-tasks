import 'dart:io';

void main() {
  Product_Manager manager = Product_Manager();
  while (true) {
    print(" ");
    print("**********   Welcome to the Product Management System!  **********");
    print("\n1. Add a new product");
    print("2. View all products");
    print("3. View a single product");
    print("4. Edit a product");
    print("5. Delete a product");
    print("6. Quit");
    print("Press a number: ");

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("Enter the product name: ");
        var name = stdin.readLineSync();
        print("Enter the product price: ");
        var price = int.parse(stdin.readLineSync() ?? '0');
        print("Enter the product discription: ");
        var info = stdin.readLineSync();
        manager.add_product(Product("$name", price, "$info"));
        print("Product added.");
        break;

      case '2':
        manager.print_products();
        break;

      case '3':
        print("Enter the product name: ");
        var name = stdin.readLineSync();
        manager.view_product("$name");
        break;

      case '4':
        print("Enter the product name: ");
        var name = stdin.readLineSync();
        manager.edit_product("$name");
        break;

      case '5':
        print("Enter the product name: ");
        var name = stdin.readLineSync();
        manager.remove_product("$name");
        break;

      case '6':
        print("Byee...");
        return;

      default:
        print("Invalid choice.");
    }
  }
}

class Product {
  String? name;
  int? price;
  String? info;

  Product(String name, int price, String info) {
    this.name = name;
    this.price = price;
    this.info = info;
  }
}

class Product_Manager {
  List current_products = [];

  //add new products
  void add_product(Product x) {
    current_products.add(x);
  }

  // view all products
  void print_products() {
    for (var value in current_products) {
      print(
          "Name: ${value.name}, Price: ${value.price}, Information: ${value.info}");
    }
    if (current_products.length == 0) {
      print("No products available.");
      return;
    }
  }

  //view a single product
  void view_product(String name) {
    bool found = false;
    for (var value in current_products) {
      if (value.name == name) {
        print(
            "Name: ${value.name}, Price: ${value.price}, Information: ${value.info}");
        found = true;
        break;
      }
    }
    if (found == false) {
      print("Item not found!!");
    }
  }

  //Edit a product(update name, discription, price)
  void edit_product(String name) {
    bool found = false;
    for (int i = 0; i < current_products.length; i++) {
      if (current_products[i].name == name) {
        print("Enter the new name for the product $name: ");
        var new_name = stdin.readLineSync();
        current_products[i].name = new_name;

        print("Enter the new price for the product $name: ");
        var new_price = stdin.readLineSync();
        current_products[i].price = int.parse(new_price ?? '0');

        print("Enter the new information about the product $name: ");
        var new_info = stdin.readLineSync();
        current_products[i].info = new_info;

        print("product $name have been updated to $new_name");

        found = true;
        break;
      }
    }
    if (found == false) {
      print("Item not found!!");
    }
  }

  //delete a product
  void remove_product(String name) {
    bool found = false;
    for (var val in current_products) {
      if (val.name == name) {
        current_products.remove(val);
        found = true;
        break;
      }
    }

    if (found) {
      print("The product $name has been removed.");
    } else {
      print("The product $name not found!!");
    }
  }
}
