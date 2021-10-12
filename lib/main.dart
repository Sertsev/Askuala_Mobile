import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import './askualapallete.dart';
import './dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Askuala LMS',
      theme: ThemeData(
        primarySwatch: AskualaPalette.askualadark,
      ),
      home: const MyHomePage(title: 'ASKUALA'),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Log In Page
Route _createRouteToHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyHomePage(
      title: "ASKUALA",
    ),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return child;
    },
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? userName, password, userType = "student";

  final List<Map<String, dynamic>> _userType = [
    {
      'value': 'student',
      'label': 'Student',
    },
    {
      'value': 'teacher',
      'label': 'Teacher',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
  ];

  void _handlePressed() {
    print("$userName $password $userType");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              GoogleFonts.akronim(fontSize: 80, fontWeight: FontWeight.normal),
        ),
        toolbarHeight: 270,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Text(
              "Log In",
              style: GoogleFonts.karla(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#5B0A36")),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              child: Column(
                children: <Widget>[
                  TextField(
                    obscureText: false,
                    onChanged: (value) {
                      userName = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter Email"),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter Password"),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    child: SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: 'student',
                      items: _userType,
                      onChanged: (newValue) {
                        userType = newValue;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: HexColor('#5B0A36'),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: HexColor('#5B0A36'),
                      ),
                      onPressed: _handlePressed,
                      child: const Text("Log In")),
                  const SizedBox(
                    height: 22,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: HexColor('#5B0A36'),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(_createRouteToChoice());
                      },
                      child:
                          const Text("Don't have an account? Register now!")),
                  const SizedBox(
                    height: 22,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: HexColor('#5B0A36'),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(_createRouteToStudentDashboard());
                      },
                      child: const Text("Dashboard")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// choice page for the user to navigate to which page to register
Route _createRouteToChoice() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const UserChoice(
      title: "ASKUALA",
    ),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return child;
    },
  );
}

class UserChoice extends StatefulWidget {
  const UserChoice({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserChoice> createState() => _UserChoice();
}

class _UserChoice extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              GoogleFonts.akronim(fontSize: 80, fontWeight: FontWeight.normal),
        ),
        toolbarHeight: 330,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 85,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 25),
                  backgroundColor: HexColor('#5B0A36'),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRouteToStudent());
                },
                child: const Text("I am a Student!")),
            const SizedBox(
              height: 22,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 24),
                  backgroundColor: HexColor('#5B0A36'),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRouteToTeacher());
                },
                child: const Text("I am a Teacher!")),
            const SizedBox(
              height: 22,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: HexColor('#5B0A36'),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRouteToHome());
                },
                child: const Text("I already have an account!")),
          ],
        ),
      ),
    );
  }
}

// to register registration page
Route _createRouteToTeacher() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const TeacherRegister(
      title: "ASKUALA",
    ),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return child;
    },
  );
}

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherRegister> createState() => _TeacherRegister();
}

class _TeacherRegister extends State<TeacherRegister> {
  String? firstName,
      middleName,
      lastName,
      email,
      phoneNumber,
      password,
      department,
      experience,
      certificates,
      dateOfBirth;

  final List<Map<String, dynamic>> _department = [
    {
      'value': 'computerScience',
      'label': 'Computer Science',
    },
    {
      'value': 'businessAdministration',
      'label': 'Business Administration',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
  ];

  final List<Map<String, dynamic>> _academicLevel = [
    {
      'value': 'master',
      'label': 'Master',
    },
    {
      'value': 'phd',
      'label': 'Ph.D.',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              GoogleFonts.akronim(fontSize: 50, fontWeight: FontWeight.normal),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Teachers Registration",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#5B0A36')),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Column(
                  children: <Widget>[
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter first name",
                      ),
                      onChanged: (var value) {
                        firstName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter middle name",
                      ),
                      onChanged: (var value) {
                        middleName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter last name",
                      ),
                      onChanged: (var value) {
                        lastName = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    DateTimePicker(
                      type: DateTimePickerType.date,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1955 - 12 - 12),
                      lastDate: DateTime.now(),
                      initialValue: 'Select date of birth',
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: HexColor('#5B0A36'),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter email",
                      ),
                      onChanged: (var value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: HexColor('#5B0A36'),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "Enter Password"),
                      onChanged: (var value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: HexColor('#5B0A36'),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "Confirm Password"),
                      onChanged: (var value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: 'master',
                      items: _academicLevel,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: HexColor('#5B0A36'),
                          )),
                    ),
                    const SizedBox(height: 10),
                    // department
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: 'computerScience',
                      items: _department,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: HexColor('#5B0A36'),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: HexColor('#5B0A36'),
                        ),
                        onPressed: () {},
                        child: const Text("Register")),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: HexColor('#5B0A36'),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_createRouteToHome());
                        },
                        child: const Text("I already have an account!")),

                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: HexColor('#5B0A36'),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_createRouteToStudent());
                        },
                        child: const Text("I am a student!")),
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

//  to student registration page
Route _createRouteToStudent() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const StudentRegister(
      title: "ASKUALA",
    ),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return child;
    },
  );
}

class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentRegister> createState() => _StudentRegister();
}

class _StudentRegister extends State<StudentRegister> {
  String? firstName,
      middleName,
      lastName,
      email,
      phoneNumber,
      password,
      department,
      experience,
      certificates,
      dateOfBirth;

  final List<Map<String, dynamic>> _department = [
    {
      'value': 'computerScience',
      'label': 'Computer Science',
    },
    {
      'value': 'businessAdministration',
      'label': 'Business Administration',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
  ];

  final List<Map<String, dynamic>> _academicLevel = [
    {
      'value': 'bsc',
      'label': 'BSc',
    },
    {
      'value': 'ms',
      'label': 'MS',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
    {
      'value': 'ba',
      'label': 'BA',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
    {
      'value': 'ma',
      'label': 'MBA',
      'textStyle': TextStyle(color: HexColor('#5B0A36')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              GoogleFonts.akronim(fontSize: 50, fontWeight: FontWeight.normal),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Students Registration",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: HexColor('#5B0A36')),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Column(
                  children: <Widget>[
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter first name",
                      ),
                      onChanged: (var value) {
                        firstName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: AskualaPalette.askualadark,
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Enter middle name",
                      ),
                      onChanged: (var value) {
                        middleName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: AskualaPalette.askualadark,
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Enter last name",
                      ),
                      onChanged: (var value) {
                        lastName = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    DateTimePicker(
                      type: DateTimePickerType.date,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1955 - 12 - 12),
                      lastDate: DateTime.now(),
                      initialValue: 'Select date of birth',
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: HexColor('#5B0A36'),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: HexColor('#5B0A36'),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: "Enter email",
                      ),
                      onChanged: (var value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: HexColor('#5B0A36'),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: "Enter Password"),
                      onChanged: (var value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.vpn_key_outlined,
                            color: AskualaPalette.askualadark,
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Confirm password"),
                      onChanged: (var value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: 'bsc',
                      items: _academicLevel,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: HexColor('#5B0A36'),
                          )),
                    ),
                    const SizedBox(height: 10),
                    // department
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: 'computerScience',
                      items: _department,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: HexColor('#5B0A36'),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: HexColor('#5B0A36'),
                        ),
                        onPressed: () {},
                        child: const Text("Register")),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: HexColor('#5B0A36'),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_createRouteToHome());
                        },
                        child: const Text("I already have an account!")),

                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: HexColor('#5B0A36'),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_createRouteToTeacher());
                        },
                        child: const Text("I am a Teacher!")),
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

// to the student dashboard
Route _createRouteToStudentDashboard() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const StudentDashboard(),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      return child;
    },
  );
}
