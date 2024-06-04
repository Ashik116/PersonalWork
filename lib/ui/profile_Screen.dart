import 'package:dokan/test2.dart';
import 'package:dokan/widget/customExpansionTile.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Account'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual image URL
            ),
            SizedBox(height: 10),
            Text(
              'John Smith',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'info@johnsmith.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Expanded(
                      child: CustomExpansionTile(leading: Icon(Icons.account_circle), title: Text("Account"),  children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5), // Match the label color
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color for the TextFormField
                                  borderRadius: BorderRadius.circular(5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // Shadow color
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset in x and y direction
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'youremail@xmail.com',
                                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners for the TextFormField
                                      borderSide: BorderSide.none, // No border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding inside the TextFormField
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Full Name",
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5), // Match the label color
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color for the TextFormField
                                  borderRadius: BorderRadius.circular(5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // Shadow color
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset in x and y direction
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'William Bennett',
                                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners for the TextFormField
                                      borderSide: BorderSide.none, // No border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding inside the TextFormField
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Street Address",
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5), // Match the label color
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color for the TextFormField
                                  borderRadius: BorderRadius.circular(5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // Shadow color
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset in x and y direction
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '465 Nolan Causeway Suite 079',
                                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners for the TextFormField
                                      borderSide: BorderSide.none, // No border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding inside the TextFormField
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Apt, Suite, Bldg(optional)",
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5), // Match the label color
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color for the TextFormField
                                  borderRadius: BorderRadius.circular(5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // Shadow color
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset in x and y direction
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Unit 512',
                                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners for the TextFormField
                                      borderSide: BorderSide.none, // No border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding inside the TextFormField
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Zip Code",
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5), // Match the label color
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                margin: EdgeInsets.only(right: 200),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color for the TextFormField
                                  borderRadius: BorderRadius.circular(5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26, // Shadow color
                                      blurRadius: 5, // Blur radius
                                      offset: Offset(0, 2), // Offset in x and y direction
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '77017',
                                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners for the TextFormField
                                      borderSide: BorderSide.none, // No border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding inside the TextFormField
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    height: 50,width: 131,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFDFDFD),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Text("Cancel")),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    height: 50,width: 131,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF1ABB9B),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Text("Save",style: TextStyle(
                                      color: Colors.white,
                                    ),)),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ], ),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Passwords'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle passwords tap
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notification'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle notification tap
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite_border),
                      title: Text('Wishlist (00)'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle wishlist tap
                      },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
