
import 'package:ctse_app/screens/admin/admin_home.dart';
import 'package:ctse_app/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: Container(
          height: MediaQuery.of(context).size.height,
          /*decoration: BoxDecoration(
           image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover
            )
          ),*/
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
                SizedBox(height:8),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                    child: Text("Forgot Password? ", style: TextStyle(color: Colors.orange, fontSize: 12)),
                  ),
                ),
                SizedBox(height:20),
                GestureDetector(
                  onTap: (){
                    auth.signInWithEmailAndPassword(email: _email, password:_password);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminHomeScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width:MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepOrange,
                      /*gradient: LinearGradient(
                        colors:[
                          const Color(0xff007ef4),
                          const Color(0xff2a758c)
                        ]
                      ),*/
                    ),
                    child: Text("Sign In", style: TextStyle(color:Colors.white, fontSize: 19),),

                  ),
                ),
                /*SizedBox(height:20),
                GestureDetector(
                  onTap: (){
                    auth.createUserWithEmailAndPassword(email: _email, password:_password);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width:MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepOrange,
                      /*gradient: LinearGradient(
                        colors:[
                          const Color(0xff007ef4),
                          const Color(0xff2a758c)
                        ]
                      ),*/
                    ),
                    child: Text("Sign Up", style: TextStyle(color:Colors.white, fontSize: 19),),

                  ),
                ),*/
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style:TextStyle(color:Colors.orangeAccent, fontSize: 13)),
                  Container(
                    padding:EdgeInsets.symmetric(vertical:8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Sign Up", style:TextStyle(color:Colors.orangeAccent, fontSize: 13,
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
