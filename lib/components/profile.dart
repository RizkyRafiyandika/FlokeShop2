import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart'; // Import this for FilteringTextInputFormatter

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  late bool isEditing;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? profileImage; // Initialize the variable

  @override
  void initState() {
    super.initState();
    isEditing = false;
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      emailController.text = prefs.getString('email') ?? '';
    });
  }

  Future<void> saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('phone', phoneController.text);
    prefs.setString('email', emailController.text);
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(227, 227, 137, 1),
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(227, 227, 137, 1),
          elevation: 0,
          // Adding the back button to the app bar
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage!)
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: isEditing
                            ? IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  _pickImage();
                                },
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Flokemon Trainer',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.black87,
                    fontSize: 18.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: isEditing
                        ? TextField(
                            controller: nameController,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            nameController.text,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: isEditing
                        ? TextField(
                            controller: phoneController,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(13),
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            phoneController.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: isEditing
                        ? TextField(
                            controller: emailController,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            emailController.text,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                isEditing
                    ? ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isEditing = false;
                          });
                          await saveProfileData();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(216, 254, 91, 1),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(216, 254, 91, 1),
                        ),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
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
