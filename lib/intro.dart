import 'package:flutter/material.dart';
import 'package:shoestore/login.dart';
import 'package:shoestore/register.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Image.asset('assets/images/s.png', width: 350, height: 400),
              SizedBox(height: 20.0,),

              Text('Get Your',
                  style: TextStyle(fontSize: 35.0,
                    color: Colors.black ,
                    fontWeight: FontWeight.bold,)
              ),
              Text(' Desired Shoe Here',
                  style: TextStyle(fontSize: 25.0,
                    color: Colors.black ,
                    fontWeight: FontWeight.bold,)
              ),
              SizedBox(height: 70.0,),
              Row(
                children: [
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> login() ));
                  },
                    child:Text('Sign in',style: TextStyle(fontSize: 30.0,
                      color: Colors.black ,
                      fontWeight: FontWeight.bold,)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                  ),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> register() ));
                  },
                    child:Text('Sign up', style: TextStyle(fontSize: 30.0,
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
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),

      );
  }
}
