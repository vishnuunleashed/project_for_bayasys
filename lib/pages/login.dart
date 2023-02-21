import 'package:bayasys/pages/landing_screen.dart';
import 'package:bayasys/provider/main_data_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialog/showSnackBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool hide = true;
  var username;
  var password;

  login(BuildContext context) async {
    final _form = formKey.currentState;

    if (_form!.validate()) {
      _form.save();

        bool response = await context.read<MainData>().login(email: username, password: password);
        if(response == true){
          showSuccess(context,"Login Success");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LandingScreen()));
        }else{
          showError(context,"Wrong Credentials");
        }


    }
  }

   register(BuildContext context) async {
    final _form = formKey.currentState;

    if (_form!.validate()) {
      _form.save();
      context.read<MainData>().insertAtRegister(context: context,email: username,password: password);
      showSuccess(context, "Registration Completed");

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).primaryColor)),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) {
                      username = val;
                    },
                    validator: (input) => !input!.contains('@')
                        ? "Should be more valid username"
                        : null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'email',
                      hintStyle:
                      TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: Icon(Icons.accessibility,
                          color: Theme.of(context).primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TextFormField(
                    obscureText: hide,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    onSaved: (val) {
                      password = val;
                    },
                    validator: (input) => input!.length == 0
                        ? "Should be a valid password"
                        : null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide =
                            !hide; // _con!.hidePassword = !_con.hidePassword;
                          });
                        },
                        color: Theme.of(context).primaryColor,
                        icon: Icon(hide == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      contentPadding: EdgeInsets.all(20),
                      hintText: '••••••••••••',
                      hintStyle:
                      TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: Icon(Icons.lock,
                          color: Theme.of(context).primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed: (){
                    login(context);
                  }, child: Text("Login")),
              SizedBox(height: 15,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed: (){
                    register(context);
                  }, child: Text("Register"))


            ],

          ),
        ),
      ),
    );
  }
}
