import 'package:cool_alert/cool_alert.dart';
import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/screens/login_screen.dart';
import 'package:dealshare/services/auth.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  @override
  final bool usernameEmpty = false;
  final bool passwordEmpty = false;
  final bool verifyFailed = false;
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final Authenticate _auth = Authenticate();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool isLoading=false;


  Future<void> resetPass() async {

    setState(() {
      isLoading=true;
    });
   dynamic result = await _auth.changePassword(_usernameController.text, _passwordController.text, _newPasswordController.text);
//print("This"+result);
    if(result==2||result==3) {

      setState(() {
        isLoading=false;
      });
    print(result);

      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Unsuccesful password change",
        onConfirmBtnTap: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      );

    } else {

      setState(() {
        isLoading=false;
      });
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Succesful password change",
          onConfirmBtnTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
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
                    Text(
                      "Change Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Enter your Email",
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
                        width: 300,
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Enter your Current Password",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          obscureText: true,
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                            labelText: "Enter a new password",
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
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: TextButton(
                        onPressed: resetPass,
                        child: Text(
                          "Change",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.grey)))),
                      ),
                    ),
                    SizedBox(height: 20),
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
