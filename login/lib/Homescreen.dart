import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen(
      {super.key,
      required this.username,});
  String username;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    Text("Login App", style: TextStyle(color: Colors.white),),
    ElevatedButton(
   onPressed: () {
                            Navigator.pop(
                                context,
                              );
                          },
  child: Icon(Icons.logout, color: Colors.white),
  style: ElevatedButton.styleFrom(
    shape: CircleBorder(
       side: BorderSide(
      color: Colors.white,
    ),
    ),
    padding: EdgeInsets.all(20),
    
  ),
),
            ],
            
            ),
            SizedBox(height: 180),
            Container(child: Text("Welcome $username", style: TextStyle(color:Colors.black),
            ),
            
            ),
            Text("Flutter",style: TextStyle(color:Colors.black, fontSize:40),),
          ],
        ),
        
      ),
      
    );
  }
}