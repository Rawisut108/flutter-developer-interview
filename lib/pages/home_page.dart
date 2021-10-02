import 'package:flutter/material.dart';

import 'album_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue.shade800,
                  Colors.blue.shade600,
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0).copyWith(top: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: usernameController,
                            validator: (String? username) {
                              if (username!.isEmpty) {
                                return "Pls enter your username.";
                              } else if (username.length < 10) {
                                return "Pls enter username more than 9 character.";
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    usernameController.clear();
                                  },
                                  icon: Icon(Icons.cancel_sharp),
                                ),
                                hintText: "Username",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: (String? passwird) {
                              if (passwird!.isEmpty) {
                                return "Pls enter your password.";
                              } else if (passwird.length < 7) {
                                return "Pls enter password more than 6 character.";
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    passwordController.clear();
                                  },
                                  icon: Icon(Icons.cancel_sharp),
                                ),
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue.shade600,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => AlbumPage()),
                                  );
                                  // usernameController.clear();
                                  // passwordController.clear();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
