import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'add_page.dart';
import 'detail_page.dart';
import 'search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The MaterialApp widget is the top-level widget that wraps the entire app.
    return const MaterialApp(
      home: RootPage(),
    );
  }
}

/// The RootPage is the main screen of the application.
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FloatingActionButton to navigate to the AddPage screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const AddPage();
          }));
        },
        backgroundColor: const Color.fromARGB(255, 7, 105, 185),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // The body of the Scaffold contains the main content of the screen.
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            // The first row contains a profile picture and a greeting message.
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 147, 153, 158),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'july 14, 2023',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Hello,'),
                        Text(
                          'Yohannes',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Notification icon positioned on the right side of the screen.
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 253, 253),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Icon(Icons.notifications_none_outlined),
                  ),
                ),
              ],
            ),
            // The second row contains the title "Available Products" and a search icon.
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, bottom: 20),
              child: Row(
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  // Search icon positioned on the right side of the row.
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const SearchPage();
                          }),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 253, 253),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 122, 120, 120),
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 122, 120, 120),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded widget allows the ListView to take up the remaining space.
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return MyCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The MyCard widget represents a single product card.
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 10),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage(
                      product: Product(
                          name: 'Nike',
                          price: 10,
                          info: "fasdl",
                          id: 'fa',
                          image: 'images/derby.jpg'),
                    );
                  }),
                );
              },
              // Image of the product displayed at the top of the card.
              child: Container(
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
                  child: Image.asset('images/derby.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
            // The ListTile displays the product name and price.
            const ListTile(
              leading: Text(
                'Solid Derby Shoes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Text(
                "\$19.88",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            // A row that displays the category and rating of the product.
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 25),
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
          ],
        ),
      ),
    );
  }
}
