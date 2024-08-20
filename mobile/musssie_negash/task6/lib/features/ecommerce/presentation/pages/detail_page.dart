import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';



/// The DetailPage is a stateful widget that displays detailed information about a product.
class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({required this.product, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// Stores the selected shoe size, initialized to -1 (no size selected).
  int _selectedSize = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SingleChildScrollView allows the content to be scrollable if it overflows.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      // Displays the product image.
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.asset('images/derby.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      // Back button to navigate back to the previous screen.
                      Positioned(
                        top: 16.0,
                        left: 16.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(255, 3, 28, 138),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Displays the product category and rating.
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Men\'s Shoe'),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('(4.0)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Displays the product name and price.
                  ListTile(
                    leading: Text(
                      widget.product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: Text(
                      "\$19.88",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
              // Displays the "Size" label.
              const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                child: Text(
                  'Size:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              // List of available shoe sizes displayed horizontally.
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSize = index + 38;
                        });
                      },
                      child: SizeCard(
                        num: 38 + index,
                        selected: _selectedSize,
                        ind: index,
                      ),
                    );
                  },
                ),
              ),
              // Displays a description of the product.
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20.0, bottom: 15),
                child: Text(
                  'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                ),
              ),
              // Row of buttons for "DELETE" and "UPDATE" actions.
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, top: 40.0, right: 45, bottom: 20),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Action to delete the product.
                        },
                        child: const Text(
                          'DELETE',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 15.0, bottom: 20),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 13, 102, 175),
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Action to update the product.
                        },
                        child: const Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The SizeCard widget represents a selectable card for shoe sizes.
class SizeCard extends StatelessWidget {
  SizeCard({
    required this.num,
    required this.selected,
    required this.ind,
    super.key,
  });

  /// The shoe size number.
  final int num;

  /// The currently selected size.
  final int selected;

  /// The index of the size option.
  final int ind;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: selected == ind + 38 ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 19, top: 19),
          child: Text(
            '$num',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
