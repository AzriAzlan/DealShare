import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/services/auth.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:country_list_pick/country_list_pick.dart';



class RegisterScreen extends StatefulWidget {
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool passwordInvalid = false;
  bool nameEmpty = false;
  bool mobileEmpty = false;
  bool addressEmpty = false;
  bool postcodeEmpty = false;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Authenticate _auth = Authenticate();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _postcodeController = TextEditingController();
  String country="";


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _postcodeController.dispose();

    super.dispose();
  }

  void onRegister() async {
    setState(() {
      _usernameController.text.isEmpty
          ? widget.usernameEmpty = true
          : widget.usernameEmpty = false;
      _passwordController.text.isEmpty
          ? widget.passwordEmpty = true
          : widget.passwordEmpty = false;
      _nameController.text.isEmpty
          ? widget.nameEmpty = true
          : widget.nameEmpty = false;
      _mobileController.text.isEmpty
          ? widget.mobileEmpty = true
          : widget.mobileEmpty = false;
      _addressController.text.isEmpty
          ? widget.addressEmpty = true
          : widget.addressEmpty = false;
      _postcodeController.text.isEmpty
          ? widget.postcodeEmpty = true
          : widget.postcodeEmpty = false;
      if (!widget.passwordEmpty && _passwordController.text.length < 6) {
        widget.passwordInvalid = true;
      }
      else {
        widget.passwordInvalid = false;
      }
    });
    if (widget.usernameEmpty || widget.passwordEmpty || widget.passwordInvalid || widget.nameEmpty || widget.mobileEmpty || widget.addressEmpty || widget.postcodeEmpty) {
      return;
    } else {
      dynamic result = _auth.registerWithEmail(
          _usernameController.text,
          _passwordController.text,
          _nameController.text,
          _genderRadioBtnVal,
          _mobileController.text,
          _addressController.text,
          _postcodeController.text,
          country,
      );

      if (result == null) {
        // Error Signin Up
        return;
      } else {
        // Signed Up
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }
  String _genderRadioBtnVal="Male";

  void _handleGenderChange(String value) {
    setState(() {
      _genderRadioBtnVal = value;
      print(_genderRadioBtnVal);
    });
  }

  @override
  Widget build(BuildContext context) {

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

                    //Email
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

                    //Password
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
                                : widget.passwordInvalid
                                ? "Password must be at least 6 characters."
                                : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    //Name
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.nameEmpty ? "Required" : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _mobileController,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.mobileEmpty ? "Required" : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    //address
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.addressEmpty ? "Required" : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    //postcode
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfig.widthMultiplier),
                      child: SizedBox(
                        width: 83 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _postcodeController,
                          decoration: InputDecoration(
                            labelText: "Postcode",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            helperText: widget.postcodeEmpty ? "Required" : "",
                            helperStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                //country
                CountryListPick(
                  appBar: AppBar(
                    backgroundColor: Colors.cyan,
                    title: Text('Pick your country'),
                  ),
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: true,
                    isShowCode: true,
                    isDownIcon: true,
                    showEnglishName: false,
                    labelColor: Colors.blueAccent,
                  ),
                  initialSelection: '+60',
                  onChanged: (CountryCode code) {
                    setState(() {
                      country = code.name;
                    });
                  },
                ),

                    //Gender
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Gender: ",style: TextStyle(fontSize: 1.3*SizeConfig.textMultiplier),),
                      Radio<String>(
                        value: "Male",
                        groupValue: _genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("Male"),
                      Radio<String>(
                        value: "Female",
                        groupValue: _genderRadioBtnVal,
                        onChanged: _handleGenderChange,
                      ),
                      Text("Female"),
                    ],
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
                          onPressed: onRegister,
                          child: Text(
                            "Create account",
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Have an account ? "),
                        Builder(
                          builder: (context) => GestureDetector(
                            child: Text(
                              "Sign in here",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
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
