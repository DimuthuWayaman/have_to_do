import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/components/dialog_box.dart';
import 'package:share_plus/share_plus.dart';
import 'package:myapp/components/todo_tile.dart';
import 'package:myapp/data/database.dart';
import 'package:url_launcher/url_launcher.dart';


import '../components/about_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Menu bar (drawer)
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List _widgetOptions = [
    Text(
      'Index 0: A B O U T  U S',
      style: optionStyle,
    ),
    Text(
      'Index 1: S H A R E',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  bool _validate = false;

  //check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask(BuildContext context) {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('This field cannot be empty'),
            duration: const Duration(milliseconds: 800)),
      );
    } else {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () => saveNewTask(context),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete tasks
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Task Deleted!'),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  //notification and reminder
  
  
    


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          shadowColor: Colors.blue,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'You Have To Do',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue[200],
          width: 250,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Image.asset(
                'assets/images/splash.png',
                width: 50,
              )),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'A B O U T  U S',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // textColor: Colors.black,
                iconColor: Colors.black,

                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  ); // Navigate to the AboutUs page
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                  'S H A R E',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                iconColor: Colors.black,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context); // Close the drawer
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.wcreation.ordinarylevel&pcampaignid=web_share'); // Navigate to the AboutUs page
                },
              ),

              //more from us
              ListTile(
                leading: Icon(Icons.link),
                title: Text(
                  'M O R E  A P P S',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                iconColor: Colors.black,
                onTap: () async {
                  Navigator.pop(context);
                  const url =
                      'https://play.google.com/store/apps/dev?id=6230833825196067565&hl=en'; // Replace with your URL
                  final Uri uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Text('V:1.0.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 5),
            height: 40,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copyright, size: 15, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                  '2024 Developed by Dimuthu Wayaman',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
