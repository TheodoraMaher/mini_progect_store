import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoestore/config.dart';
import 'package:shoestore/home.dart';
import 'package:shoestore/models/user_model.dart';
import 'package:shoestore/pass.dart';
import 'package:shoestore/register.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool ispassword = true;
  Icon icon = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Color(0xfffce4ec),
        appBar: AppBar(  backgroundColor:  Color(0xfffce4ec)),
        body:
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:     SingleChildScrollView(
            child: Column(
              children: [
                Text('SIGN IN',
                    style: TextStyle(fontSize: 50.0,
                      color: Colors.black ,
                      fontWeight: FontWeight.bold,)
                ),
                SizedBox(height: 40.0,),
            Form(
                child:
                Column(
                  children: [

                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding:  EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(label: Text('email'),
                            icon: Icon(Icons.mail)
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding:  EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        obscureText: ispassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: icon,
                              onPressed: () {
                                ispassword = !ispassword;
                                if (ispassword) {
                                  icon = Icon(Icons.visibility);
                                } else {
                                  icon = Icon(Icons.visibility_off);
                                }
                                setState(() {

                                });
                              }

                          ),
                          label: Text('password'),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    TextButton(onPressed: () {
                      LoginUser(
                          emailController.text,
                          passController.text);
                    },
                      child:Text('SIGN IN', style: TextStyle(fontSize: 30.0,
                        color: Colors.black ,
                        fontWeight: FontWeight.bold,)),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                  side: BorderSide(color: Colors.black )
                              )
                          )
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => pass())


                      );
                    },
                      child:Text('forget pass', style: TextStyle(fontSize: 10.0,
                        color: Colors.black )),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                  side: BorderSide(color: Colors.black )
                              )
                          )
                      ),
                    ),

                  ],
                )
            ),
        ],
            ),
          )
    )
    );
  }
  user? userModel;
  Future LoginUser(String email, String pass) async {
    var responce = await Dio().get('${APIconfig.BASEURL}userLogin.php',queryParameters: {
      'email':email,
      'password':pass,
    });
    print('${APIconfig.BASEURL}userLogin.php?email=$email&password=$pass');
    userModel= user.fromJson(responce.data);
    print(userModel!.message);
    if (userModel!.message == "User Logged in successfully") {
      globalUserModel = userModel;
      /// NAvigate to home
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              home()));
    } else {
      // Toast
      var snackBar = SnackBar(
        content: Text(userModel!.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}
