
import 'package:ctse_app/screens/admin/admin_home.dart';
import 'package:ctse_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:40),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Color(0xFFB3B1B1), fontSize: 15),
                    contentPadding:EdgeInsets.symmetric(vertical:12, horizontal:12),
                  ),
                  onChanged: (val){
                    setState(() {
                      _email = val.trim();
                    });
                  },
                ),
              ),
              SizedBox(height:12),
              TextFormField(
                obscureText:true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xFFB3B1B1), fontSize: 15),
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 12)
                ),
                onChanged: (val){
                  setState(() {
                    _password = val.trim();
                  });
                },
              ),
              SizedBox(height:20),
              GestureDetector(
                onTap: (){
                  auth.createUserWithEmailAndPassword(email: _email, password:_password);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminHomeScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width:MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepOrange,
                  ),
                  child: Text("Sign Up", style: TextStyle(color:Colors.white, fontSize: 19),),

                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style:TextStyle(color:Colors.orangeAccent, fontSize: 13)),
                  Container(
                    padding:EdgeInsets.symmetric(vertical:8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Sign In", style:TextStyle(color:Colors.orangeAccent, fontSize: 13,
                            decoration:TextDecoration.underline,
                          )),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
