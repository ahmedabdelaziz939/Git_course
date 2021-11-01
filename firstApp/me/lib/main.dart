limport 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ahmed",
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}
 _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.brown,
                backgroundImage: AssetImage('assets/images/mem.jpg'),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Ahmed Abdelaziz',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Flutter developer',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 25,),
                Expanded(
                child: ListView(
                  children: [
                    Cards(contactText: '+201151093063',icon: Icons.phone,  tap: ()=> _launchURL('tel:+201151093063'),), 
                    Cards(contactText:  'Ahmed Abd Elaziz', icon: Icons.facebook, tap: () =>_launchURL('https://www.facebook.com/ahmed201710')),
                    Cards(contactText:  '_ahmedabdelaziz_17', icon: FontAwesome.instagram,tap: () => _launchURL('https://www.instagram.com/_ahmedabdelaziz_17/'),),
                    Cards(contactText: 'ahmedabdelaziz939', icon: FontAwesome.github,tap: () => _launchURL('https://github.com/ahmedabdelaziz939/Git_course'),),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String contactText;
  final Function tap;
  final IconData icon;
  const Cards(
      {required this.contactText, required this.icon,required this.tap});
  @override
  Widget build(BuildContext context) {   
    
  return
GestureDetector(
      child: Card(
        elevation: 10,
        color: Colors.blueGrey[900],
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),

        child:Padding(
          padding: EdgeInsets.all(7),
          child: ListTile(
            title: Text(
              contactText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
            ),
          ),
           leading: Icon(
          icon,
          size: 35.0,
          color: Colors.grey,
        ),
      ),
      ),
      ),
      onTap: () {
        tap();
      }
  );

  }
}
    
//     Card(
      
//       margin: const EdgeInsets.symmetric(
//         vertical: 10.0,
//         horizontal: 15.0,
//       ),
//       color: Colors.blueGrey[900],
//       child:Padding(padding: EdgeInsets.all(7.5),
//         child: ListTile(
//         title: Text(
//           contactText,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//           ),
//         ),
//         leading: Icon(
//           icon,
//           size: 35.0,
//           color: Colors.grey,
//         ),
//       onTap: () =>tap,
//       )
//       ),
//     );
//   }
// }
//  //            Card(
    //   margin: const EdgeInsets.symmetric(
    //     vertical: 10.0,
    //     horizontal: 15.0,
    //   ),
    //   color: Colors.blueGrey[900],
    //   child: ListTile(
    //     title: Text(
    //       '+201151093063',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 22,
    //       ),
    //     ),
    //     leading: Icon(
    //         Icons.phone,
    //       size: 35.0,
    //     ),
    //     tap: ()=> _launchURL('tel:+201151093063'),
        
    //   ),
    // )
              // Card(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 10.0,
              //     horizontal: 15.0,
              //   ),
              //   color: Colors.blueGrey[900],
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.facebook,
              //       size: 40.0,
              //     ),
              //     title: Text(
              //       'ahmedabdelaziz939@yahoo.com',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 22,
              //       ),
              //     ),
              //     tap: () =>
              //         _launchURL('https://www.facebook.com/ahmed201710'),
              //   ),
              // ),
              // Card(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 10.0,
              //     horizontal: 15.0,
              //   ),
              //   color: Colors.blueGrey[900],
              //   child: ListTile(
              //     leading: Icon(
              //       FontAwesome.instagram,
              //       size: 40.0,
              //     ),
              //     title: Text(
              //       '_ahmedabdelaziz_17',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 22,
              //       ),
              //     ),
                  // tap: () => _launchURL(
                  //     'https://www.instagram.com/_ahmedabdelaziz_17/'),
              //   ),
              // ),
              // Card(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 10.0,
              //     horizontal: 15.0,
              //   ),
              //   color: Colors.blueGrey[900],
              //   child: ListTile(
              //     leading: Icon(
              //       FontAwesome.github,
              //       size: 40.0,
              //     ),
              //     title: Text(
              //       'ahmedabdelaziz939',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 22,
              //       ),
              //     ),
                  // tap: () => _launchURL(
                  //     'https://github.com/ahmedabdelaziz939/Git_course'),
              //   ),
              // ),