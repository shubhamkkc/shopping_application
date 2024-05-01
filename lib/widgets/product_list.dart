import 'package:flutter/material.dart';
import 'package:shopping_application/global_variable.dart';
import 'package:shopping_application/widgets/product_card.dart';
import 'package:shopping_application/pages/product_desc.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Mens', 'Women', 'Kids'];
  List<Map<String, dynamic>> filterProduct = products;
  String? filter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Text(
                    "Cloth\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50)))),
                ))
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            filter = filters[value];
                            print(filter);
                            if (filter == 'All') {
                              filterProduct = products;
                            } else {
                              filterProduct = products
                                  .where((item) => item['category'] == filter)
                                  .toList();
                            }
                          });
                          print("chip clicked");
                        },
                        child: Chip(
                            side: const BorderSide(color: Colors.white),
                            backgroundColor: filter == filters[value]
                                ? const Color.fromARGB(255, 235, 70, 70)
                                : const Color.fromARGB(77, 104, 201, 185),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(8),
                            label: Text(
                              filters[value],
                            )),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: size.width > 600
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.4),
                      itemCount: filterProduct.length,
                      itemBuilder: (context, value) {
                        final item = filterProduct[value];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                            return ProductDesc(
                              product: item,
                            );
                          })),
                          child: ProductCard(
                              title: item['title'] as String,
                              price: item['price'] as String,
                              image: item['image'] as String,
                              size: item['size'] as List<String>,
                              backgroundColor: value.isEven
                                  ? const Color.fromARGB(26, 245, 102, 102)
                                  : const Color.fromARGB(77, 104, 201, 185)),
                        );
                      })
                  : ListView.builder(
                      itemCount: filterProduct.length,
                      itemBuilder: (context, value) {
                        final item = filterProduct[value];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                            return ProductDesc(
                              product: item,
                            );
                          })),
                          child: ProductCard(
                              title: item['title'] as String,
                              price: item['price'] as String,
                              image: item['image'] as String,
                              size: item['size'] as List<String>,
                              backgroundColor: value.isEven
                                  ? const Color.fromARGB(26, 245, 102, 102)
                                  : const Color.fromARGB(77, 104, 201, 185)),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
