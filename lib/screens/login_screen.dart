import 'package:dealshare/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reset_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool usernameEmpty = false;
  final bool passwordEmpty = false;
  final bool verifyFailed = false;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: 120,
                      image: AssetImage('assets/logo.png'),
                    ),

                    SizedBox(height: 30),

                    Text(
                      "WELCOME TO REWARDS4U",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: 600,
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.usernameEmpty ? "Required" : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: SizedBox(
                        width: 600,
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.passwordEmpty
                                ? "Required"
                                : widget.verifyFailed
                                    ? "Password or Username is invalid"
                                    : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reset()),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,0),
                      child: SizedBox(
                        height: 55,
                        width: 600,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(color: Colors.grey,)
                          ),

                          Padding(padding: EdgeInsets.all(15),child: Text("OR",style: TextStyle(fontSize: 20),),),

                          Expanded(
                              child: Divider(color: Colors.grey,)
                          ),
                        ]
                    ),

                    SizedBox(height: 20),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: SizedBox(
                        height: 55,
                        width: 600,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: 100,
                                image: AssetImage('assets/facebook.png'),
                              ),
                              Text(
                                "SIGN IN WITH FACEBOOK",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                          ),
                        ),
                      ),
                    ),



                    SizedBox(
                      height: 40,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dont have an account ? "),
                        Builder(
                          builder: (context) => GestureDetector(
                            child: Text(
                              "Sign up here",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            ),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
