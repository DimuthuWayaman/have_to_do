import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

         backgroundColor: Colors.blue[900],
         appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'A B O U T  U S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
         ),
         body: 
           
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
              
              children: [
                Padding(
                  
                  padding: const EdgeInsets.only(top:25),
                  child: Center(
                    child: CircleAvatar(
                      
                      radius: 90,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.people,
                        size:120,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(-8,8),
                            
                            blurRadius: 15,
                          ),
                        
                          
                        ],
                        
                      ),
                    ),
                  ),
                ),
                
               
               
                
              ],
            ),
         ),
              
                      
          bottomNavigationBar: Container(
             height: 330,
            decoration: BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                   topRight: Radius.circular(50),
               ),
          ),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Icon(Icons.email_rounded, size: 60,

              color: Colors.blue,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left:15, right: 15),
              child: const Icon(Icons.phone, size: 60, color: Colors.blue),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Icon(Icons.facebook, size: 60, color: Colors.blue),
            ),
            
          ],
          
        ),
        
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                
                
                children: [
                  Text("Contact Informations",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]
                    ),
                  ),
                    
                  
                ],
              ),
            ],
          ),
        ),
         Flexible(
           child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              
                  
                  
                  children: [
                    Text("Email: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("dimuthuwayaman@gmail.com",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                      
                    
                  
              ],
            ),
                   ),
         ),
         Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            
                
                
                children: [
                  Text("Phone: ",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("+9477 4949 926",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                    
                  
                
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            
                
                
                children: [
                  Text("Social: ",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text("Dimuthu Wayaman",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                    
                  
                
            ],
          ),
        ),
      ],
    ),
  ),
),

     ),
      );
  }
}