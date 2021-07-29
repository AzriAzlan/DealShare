import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/services/auth.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'reset_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool verifyFailed = false;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Authenticate _auth = Authenticate();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading=false;

  void onLogin() async {
    setState(() {
      _usernameController.text.isEmpty
          ? widget.usernameEmpty = true
          : widget.usernameEmpty = false;
      _passwordController.text.isEmpty
          ? widget.passwordEmpty = true
          : widget.passwordEmpty = false;
    });
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    } else {

      setState(() {
        isLoading=true;
      });

      dynamic result = await _auth.signInEmail(
          _usernameController.text, _passwordController.text);
      setState(() {
        isLoading=false;
      });

      if (result == null) {
        print("error signin");
        return;
      } else {
        print("signedin");
        print(result);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }

  void onFacebookLogin() async {
    setState(() {
      isLoading=true;
    });
    dynamic result = await _auth.signInWithFacebook();
    setState(() {
      isLoading=false;
    });
    if (result == null) {
      print("error signin");
      return;
    } else {
      print("signedin");
      print(result);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void onGoogleLogin() async {
    setState(() {
      isLoading=true;
    });
    dynamic result = await _auth.signInWithGoogle();
    setState(() {
      isLoading=false;
    });
    if (result == null) {
      print("error signin");
      return;
    } else {
      print("signedin");
      print(result);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    //
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return isLoading? Scaffold(body: Center(child: CircularProgressIndicator())):Scaffold(
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
                      height: 9.5 * SizeConfig.heightMultiplier,
                      image: AssetImage('assets/logo.png'),
                    ),
                    SizedBox(height: 2.4 * SizeConfig.heightMultiplier),
                    Text(
                      "WELCOME TO REWARDS4U",
                      style: TextStyle(
                          fontSize: 1.6 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.4 * SizeConfig.heightMultiplier),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Email",
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier,
                          vertical: 0.5 * SizeConfig.heightMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
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
                        "Change Password",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reset()),
                      ),
                    ),
                    SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          2 * SizeConfig.widthMultiplier,
                          0,
                          2 * SizeConfig.widthMultiplier,
                          0),
                      child: SizedBox(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 55 * SizeConfig.widthMultiplier,
                        child: TextButton(
                          onPressed: onLogin,
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 1.6 * SizeConfig.textMultiplier),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.grey,
                          )),
                      Padding(
                        padding: EdgeInsets.all(2 * SizeConfig.widthMultiplier),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              fontSize: 1.5 * SizeConfig.textMultiplier),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            color: Colors.grey,
                          )),
                    ]),
                    SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          2 * SizeConfig.widthMultiplier,
                          0,
                          2 * SizeConfig.widthMultiplier,
                          0),
                      child: SizedBox(
                        height: 7 * SizeConfig.heightMultiplier,
                        width: 65 * SizeConfig.widthMultiplier,
                        child: TextButton(
                          onPressed: onFacebookLogin,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: 13 * SizeConfig.widthMultiplier,
                                image: AssetImage('assets/facebook.png'),
                              ),
                              Text(
                                "SIGN IN WITH FACEBOOK",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 1.5 * SizeConfig.textMultiplier),
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
                    SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          2 * SizeConfig.widthMultiplier,
                          0,
                          2 * SizeConfig.widthMultiplier,
                          0),
                      child: SizedBox(
                        height: 7 * SizeConfig.heightMultiplier,
                        width: 65 * SizeConfig.widthMultiplier,
                        child: TextButton(
                          onPressed: onGoogleLogin,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: 13 * SizeConfig.widthMultiplier,
                                image: AssetImage('assets/google.png'),
                              ),
                              Text(
                                "SIGN IN WITH GOOGLE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 1.5 * SizeConfig.textMultiplier),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red[900]),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 3.2 * SizeConfig.heightMultiplier),
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
