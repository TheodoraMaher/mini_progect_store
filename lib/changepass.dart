import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoestore/config.dart';

class changepass extends StatefulWidget {
  const changepass({Key? key}) : super(key: key);

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  TextEditingController pass = TextEditingController();
  bool ispassword = true;
  Icon icon = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
      ),
      body:  Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding:  EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black)),
            child: TextFormField(
              controller: pass,
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
          TextButton(onPressed: () {
            changepass( pass.text);
          },
            child:Text('change pass', style: TextStyle(fontSize: 30.0,
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
        ],
      ),
    );
  }

  Future changepass(String pass) async {
    var responce = await Dio().get('${APIconfig.BASEURL}changePassword.php',queryParameters: {
      'password':pass,
    });

    String msg = responce.data['message'];

    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  }

