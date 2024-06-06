import 'package:animate_do/animate_do.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dokan/ui/sing_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var isSplashing = true;

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        // Delay for 2 seconds
        await Future.delayed(Duration(seconds: 2));

        // Show a snack bar if the splash screen is still active after 2 seconds
        Future.delayed(Duration(seconds: 2)).whenComplete(() {
          if (isSplashing) {
            snackBarMsg("Internet Connection is very slow");
          }
        });

        isSplashing = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignINScreen()),
        );
      } catch (e) {
        // Handle exceptions if any...
      }
    } else {
      // No internet connection, show a dialog
      showInternetDialog();
    }
  }

  void showInternetDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("No Internet Connection"),
              Icon(Icons.signal_wifi_connected_no_internet_4,
                  color: Colors.red),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Please check your internet connection."),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      checkConnection(); // Retry getting data
                    },
                    child: Text("Retry"),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return !isSplashing
        ? Container()
        : Scaffold(
            key: _scaffoldKey,
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInRight(
                              duration: Duration(milliseconds: 800),
                              child: Image.asset(
                                "assets/dokan.png",
                                height: 150,
                                width: 150,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void snackBarMsg(loginErrorMessage) {
    //print("ok");
    final snackBar = SnackBar(
      duration: Duration(seconds: 10),
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void refresh() {
    if (mounted) {
      setState(() {
        checkConnection();
      });
    }
  }
}
