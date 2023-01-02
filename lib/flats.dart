import 'package:flutter/material.dart';
import 'package:shoestore/fav.dart';

class flats extends StatefulWidget {
  const flats({Key? key}) : super(key: key);

  @override
  State<flats> createState() => _flatsState();
}

class _flatsState extends State<flats> {
  List<String> images = [
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',

  ];
  List<String> title = [
    'Title1',
    'title2',
    'title3',
    'title4',

  ];
  List<String> mass = [
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
        title: Text('FLATS',
            style: TextStyle(fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: GridView.builder(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(

                      child: Container(
                        height:150,
                        width: double.infinity,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: double.infinity,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                          ),
                                          color: Colors.grey.withOpacity(0.6),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => fav()));
                                          },
                                          icon: Icon(Icons.favorite, color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Text(
                              title[index],

                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              mass[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
