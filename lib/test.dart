import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dokan/Model/response_model.dart';
import 'package:dokan/Utils/api_service.dart';

class ProductListScreenn extends StatefulWidget {
  @override
  _ProductListScreennState createState() => _ProductListScreennState();
}

class _ProductListScreennState extends State<ProductListScreenn> {
  late Future<List<Product>> futureProducts;
  bool isFilterVisible = false;
  String? selectedSortOption;

  @override
  void initState() {
    super.initState();
    futureProducts = SignInApiService().fetchProducts();
  }

  void applyFilter(String filter) {
    setState(() {
      selectedSortOption = filter;
      futureProducts = SignInApiService()
          .fetchProducts(); // Fetch products again, or apply filter locally
    });
  }

  void sortProducts(List<Product> products) {
    if (selectedSortOption == 'Newest') {
      products.sort((a, b) => b.dateCreated.compareTo(
          a.dateCreated)); // Assuming Product has a dateAdded property
    } else if (selectedSortOption == 'Oldest') {
      products.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
    } else if (selectedSortOption == 'Price_low_high') {
      products.sort((a, b) => a.salePrice.compareTo(b.salePrice));
    } else if (selectedSortOption == 'Price_high_low') {
      products.sort((a, b) => b.salePrice.compareTo(a.salePrice));
    } else if (selectedSortOption == 'Pest_selling') {}
  }

  void setSortBy(String value) {
    setState(() {
      selectedSortOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Product List', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(Icons.search, color: Colors.black),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showFilterBottomSheet(context, applyFilter);
                        },
                        icon: Icon(Icons.filter_list, color: Colors.blue),
                        label: Text('Filter',
                            style: TextStyle(color: Colors.blue)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('Sort by',
                              style: TextStyle(color: Colors.black)),
                          IconButton(
                            icon: Icon(Icons.sort, color: Colors.black),
                            onPressed: () {
                              // Handle sort button press
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.black),
                            onPressed: () {
                              // Handle more options button press
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                              'Failed to load products: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No products available'));
                    }

                    List<Product> products = snapshot.data!;
                    sortProducts(products);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          return StylishCard(product: products[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StylishCard extends StatelessWidget {
  final Product product;

  StylishCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: product.imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Center(
                          child: Icon(
                        Icons.error,
                        size: 50,
                      )),
                    )
                  : Icon(Icons.image_not_supported),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '\$${product.price}   ',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$79.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

void showFilterBottomSheet(
    BuildContext context, Function(String) onFilterSelected) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return FilterBottomSheet(onFilterSelected: onFilterSelected);
    },
  );
}

class FilterBottomSheet extends StatefulWidget {
  final Function(String) onFilterSelected;

  FilterBottomSheet({required this.onFilterSelected});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedFilter = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildFilterOption('Newest'),
          _buildFilterOption('Oldest'),
          _buildFilterOption('Price low > High'),
          _buildFilterOption('Price high > Low'),
          _buildFilterOption('Best selling'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  child: Container(
                    height: 50,
                    width: 131,
                    decoration: BoxDecoration(
                        color: Color(0xFFFDFDFD),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Cancel")),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                  onTap: () {
                    widget.onFilterSelected(selectedFilter);
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    child: Container(
                      height: 50,
                      width: 131,
                      decoration: BoxDecoration(
                          color: Color(0xFF1ABB9B),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String option) {
    return CheckboxListTile(
      title: Text(option),
      value: selectedFilter == option,
      onChanged: (bool? value) {
        setState(() {
          selectedFilter = option!;
        });
      },
      activeColor: Colors.pink,
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
