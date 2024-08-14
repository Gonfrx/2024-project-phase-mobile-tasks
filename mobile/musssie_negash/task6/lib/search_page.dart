import 'package:flutter/material.dart';

/// The SearchPage is a stateful widget that allows users to search for products.
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  /// RangeValues to represent the minimum and maximum price selected by the user.
  RangeValues val = const RangeValues(10, 2000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row containing the back button and the title.
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 5, 113, 202),
                    size: 23,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    'Search Product',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
            // Row containing the search field and filter button.
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10, top: 20, bottom: 15),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 236, 236),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12, top: 6),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Leather',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 190),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 13, 33, 211),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Filter button that could be used to open additional filtering options.
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 18, 84, 226),
                  ),
                  child: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // Expanded widget to display a list of products.
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const MyCard();
                },
              ),
            ),
            // Section title for categories.
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Placeholder for category selection.
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 236, 236),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                    ),
                  ),
                ),
              ),
            ),

            // Section title for the price range slider.
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // RangeSlider for selecting a price range.
            RangeSlider(
              values: val,
              min: 10,
              max: 2000,
              divisions: 100,
              activeColor: const Color.fromARGB(255, 20, 89, 239),
              labels: RangeLabels(
                '${val.start.round()}',
                '${val.end.round()}',
              ),
              onChanged: (newValues) {
                setState(() {
                  val = newValues;
                });
              },
            ),
            // Button to apply the selected filters.
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 50,
                width: double.infinity,
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
                  onPressed: () {},
                  child: const Text(
                    'APPLY',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

/// The MyCard widget represents a single product card in the search results.
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            // Image of the product displayed at the top of the card.
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
                child: Image.asset('images/derby.jpg', fit: BoxFit.cover),
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
