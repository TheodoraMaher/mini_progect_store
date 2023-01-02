
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoestore/config.dart';
import 'package:shoestore/home.dart';
import 'package:http/http.dart' as http;
import 'package:shoestore/models/user_model.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool ispassword = true;
  Icon icon = Icon(Icons.visibility);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usertNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffce4ec),
        appBar: AppBar(backgroundColor: Color(0xfffce4ec)),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('SIGN UP',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                label: Text('first_name'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                label: Text('last_name'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: usertNameController,
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                label: Text('user_name'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                  label: Text('email'), icon: Icon(Icons.mail)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: passController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
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
                                      setState(() {});
                                    }),
                                label: Text('password'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                label: Text('phone'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.streetAddress,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                              decoration: InputDecoration(
                                label: Text('adress'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),

                          TextButton(
                            onPressed: () {
                              registerNewUser(
                                  firstNameController.text,
                                  lastNameController.text,
                                  usertNameController.text,
                                  emailController.text,
                                  passController.text,
                                  phoneController.text,
                                  addressController.text
                               );
                            },
                            child: Text('SIGN UP',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(
                                            color: Colors.black)))),
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }

  user? userModelObject;

  Future registerNewUser(String fname, String lname, String uname, String email,
      String pass, String phone, String address) async {
    var url = Uri.parse
      ('${APIconfig
        .BASEURL}userRegister.php?first_name=$fname&last_name=$lname&user_name=$uname&user_email=$email&user_password=$pass&user_phone=$phone&address=$address');
    print(url);
    var response = await http.get(url);
    userModelObject = user.fromJson(jsonDecode(response.body));
    if (userModelObject!.message == "User Registered Successfully") {
      globalUserModel = userModelObject;
      /// NAvigate to home
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              home()));
    } else {
      // Toast
      var snackBar = SnackBar(
        content: Text(userModelObject!.message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
