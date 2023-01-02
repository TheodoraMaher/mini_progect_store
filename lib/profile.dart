import 'package:flutter/material.dart';
import 'package:shoestore/changepass.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => changepass())
            );
          },
            child:Text('change pass', style: TextStyle(fontSize: 10.0,
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
      ),
    );
  }
}
