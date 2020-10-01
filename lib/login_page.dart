import 'package:flutter/material.dart';
import 'package:myapp/randomward.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget textField(String hint, bool obsText) {
    return TextField(
      obscureText: obsText,
      style: TextStyle(fontFamily: 'Arial', fontSize: 20.0),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 15),
          hintText: hint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }

  Widget loginButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: fetchData,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Arial', fontSize: 20.0)
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 155.0,
                child: Image.asset(
                  "assets/images/usha_logo_font_page.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 45.0),
              textField("Email", false),
              SizedBox(height: 25.0),
              textField("Password", true),
              SizedBox(height: 35.0),
              loginButton(),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    ));
  }

  void fetchData() {
    fetchAlbum().then((value) {
      if (value.id == 3)
        _startList();
      else {
        Fluttertoast.showToast(
            msg: "Wrong user",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.blueGrey,
            fontSize: 16.0);
        /* Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Wrong user"),
        )); */
      }
    });
  }

  void _startList() {
    Route route = MaterialPageRoute(builder: (context) => RandomWords());
    Navigator.pushReplacement(context, route);
  }
}
