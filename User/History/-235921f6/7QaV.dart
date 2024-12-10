import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = '';
  final TextEditingController identifierController = TextEditingController(); // Combined controller for username/phone
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String identifier = identifierController.text.trim();

      try {
        // Check if the user exists in the database based on role
        final response = await Supabase.instance.client
            .from('users') // Assuming 'users' is your table name
            .select()
            .eq(selectedRole == 'Teacher' ? 'username' : 'phone_number', identifier)
            .single()
            .execute();

        if (response.error == null && response.data != null) {
          // User found, navigate to the appropriate dashboard
          if (selectedRole == 'Student') {
            Navigator.pushReplacementNamed(context, '/studentDashboard');
          } else if (selectedRole == 'Teacher') {
            Navigator.pushReplacementNamed(context, '/teacherDashboard');
          } else if (selectedRole == 'Parent') {
            Navigator.pushReplacementNamed(context, '/parentDashboard');
          }
        } else {
          // Show error message if user not found
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found. Please check your details.')));
        }
      } catch (e) {
        print('Error logging in: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred during login.")));
      }
    }
  }

  void _launchWhatsApp() async {
    const url = 'https://wa.me/your_number_here'; // Replace with your WhatsApp number
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedRole = 'Student';
                    });
                  },
                  child: Text('Student'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedRole = 'Teacher';
                    });
                  },
                  child: Text('Teacher'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedRole = 'Parent';
                    });
                  },
                  child: Text('Parent'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: identifierController,
                    decoration: InputDecoration(
                      labelText: selectedRole == 'Teacher' ? 'Username' : 'Username or Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return selectedRole == 'Teacher' ? 'Please enter your username' : 'Please enter your username or phone number';
                      }
                      if (selectedRole == 'Parent' && !RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                        return 'Please enter a valid phone number (10 to 15 digits)';
                      }
                      if (selectedRole == 'Student' && !RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                        return 'Please enter a valid username or phone number (alphanumeric and underscores only)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup'); // Adjust this route as needed
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _launchWhatsApp,
                    child: Text('Having trouble logging in? Contact us on WhatsApp'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
