import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: widget.leading,
          title: widget.title,
          trailing: Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_forward_ios),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        _isExpanded
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: widget.children,
          ),
        )
            : Container(),
      ],
    );
  }
}

// Usage
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomExpansionTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            children: <Widget>[
              Opacity(
                opacity: 0.5, // Set the desired opacity value (0.0 to 1.0)
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Email"),
                ),
              ),
              SizedBox(height: 5),
              // Add other children widgets here
            ],
          ),
          // Add other ListTiles or CustomExpansionTiles here
        ],
      ),
    );
  }
}
