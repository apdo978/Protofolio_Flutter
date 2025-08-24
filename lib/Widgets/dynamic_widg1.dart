
import 'package:flutter/material.dart';//to use the prepered widgets
import 'package:audioplayers/audioplayers.dart';
import 'dart:math'; //to use the random number generator

class DynamicWidget extends StatefulWidget {
  const DynamicWidget({ Key? key }) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  String imagePath = "images/Light.jpg";
  
final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    int random;
    return   Column(// or Row //by Default take all the screen or  biggest childs width
    // verticalDirection: VerticalDirection.up, //reversed
mainAxisAlignment: MainAxisAlignment.center, 
    // mainAxisSize: MainAxisSize.min, //y-axis in column to take only the content space

    // mainAxisAlignment: MainAxisAlignment.start,//default
    // mainAxisAlignment: MainAxisAlignment.end, //like flex direction end 
    // mainAxisAlignment: MainAxisAlignment.center, 
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
    // mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    // mainAxisAlignment: MainAxisAlignment.spaceAround, 

    // crossAxisAlignment: CrossAxisAlignment.start, //default x in column axis horizointal
    // crossAxisAlignment: CrossAxisAlignment.end, 
    // crossAxisAlignment: CrossAxisAlignment.stretch, 
    // if u want the column to start from the other side u
    // can use the hidden container with infinty width 
    // with crossAxisAlignment: CrossAxisAlignment.end, 

      children: [

        // Expanded(
        //   flex: 3, as  ratio 
        //   child:Image.asset('images/Light.jpg')
        //   ), //Flex widget to fit all screens and take all width 
        // Expanded(
        //   flex: 1,
        //   child:Image.asset('images/Light.jpg')// dot after widget called constructor 
        //   ), //Flex widget to fit all screens and take all width 
        CircleAvatar(//round avatar
        radius: 50,
        backgroundColor: Colors.white, // background color of the circle
        backgroundImage: AssetImage(imagePath), // image inside the circle
        ),
 
        Text(
          "Abdelrhman Muhamed",
// textAlign:TextAlign.center, // to center the text inside the widget

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
        Text(
          "Software Developer",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade200,
            fontWeight: FontWeight.bold,

          ),
        ),
        
     SizedBox(
      width: 200,
        height: 20,
        child: Divider(
          color: Colors.cyan.shade200,
        ),
      ),


// Expanded(child: child) // only used inside column row or flex Widget

        Card(//container
                margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(20), // padding inside the container
                color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),

            child: TextButton(
              onLongPress: () => {
                // this will be changed but not detected by app
                // so u should use setState
                setState(() {
                  
               random =  Random().nextInt(2)+1;//starting from 0 to max -1  max value to generate random number
                // 2 =>0,1
                print(random);
                })
              },
              onPressed:  () {
                  setState( () {
                imagePath = imagePath == "images/Light.jpg" ? "images/download.jpg" : imagePath == "images/download.jpg" ? "images/download (1).jpg" : "images/Light.jpg";
                  });
                  player.play(AssetSource('assets/Sounds/videoplayback.m4a'));
              },
              child: ListTile( //to add icon and text in one line
                leading: Icon(
                  Icons.phone,
                  color: Colors.cyan[700],
              // Icons.star,
              // size: 200,
              // color: Colors.blue,
                ),
                // SizedBox(width: 15), //to add space between icon and text
              
                title: Text("Phone",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
                ),
              
                subtitle:Text(
                  "+20 123 456 7890",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[900],
                ),
              
                        ),
            ),
        )
        ),
        
        Card(//to give u the smooth corners
          margin: EdgeInsets.all(15),
          color: Colors.white,
          child: Padding( // to add padding to the card widget
            padding: const EdgeInsets.all(10.0),
            child: ListTile( //Row(
             
               leading: Icon(
                  Icons.email,
                  color: Colors.cyan[700],
                ),

                // SizedBox(width: 15), //to add space between icon and text
                title: Text("Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                ),

                subtitle:Text(
                  "abdelrhman@Email.com",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[900],
                ),
              
                   ),
          ),
       ),
      ]
      
    );
   
  }
}