import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: LandingPage(),
));




class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/altruism-blanc-fair.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/test-circle-black.png', width: 350, height: 350),
              SizedBox(height: 20),
              Text(
                '+216-SIGN-UNITY',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Payfair',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Bridging Communication Gaps, One Gesture at a Time!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xDF9D363C),
                  fontFamily: 'Payfair-italic',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Payfair',
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF1C5C5),
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  'I Already Have an Account',
                  style: TextStyle(color: Colors.grey, fontFamily: 'Payfair'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  String? _selectedReason;

  final List<String> _reasons = [
    'I am deaf',
    'A relative of mine is deaf',
    'Other'
  ];

  void signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with sign-up logic
      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Confirm Password: ${confirmPasswordController.text}');
      print('Reason for Signing Up: $_selectedReason');

      // Navigate to the next page after successful sign-up
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => IntroductionPage()),
       );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Create an Account',
          style: TextStyle(
            fontFamily: 'Payfair',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xDF9D363C),
          ),
        ),
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.white,
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/altruism-blanc-fair.png'),
          fit: BoxFit.cover,
    ),
    ),
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/hello-removebg-preview.png',
                  height: 50,
                ),
                SizedBox(width: 8),
                Text(
                  '     Welcome! Excited to have you on board!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Payfair-italic',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Payfair',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Payfair',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Email validation using regex
                        final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Payfair',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        // Add password validation logic here if needed
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm your Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Payfair',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedReason,
                        items: _reasons.map((reason) {
                          return DropdownMenuItem(
                            value: reason,
                            child: Text(
                              reason,
                              style: TextStyle(
                                fontFamily: 'Payfair',
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedReason = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Reason for Signing Up',
                          labelStyle: TextStyle(
                            fontFamily: 'Payfair',
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signUp(context);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Payfair',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF1C5C5),
                textStyle:
                TextStyle(color: Colors.white, fontFamily: 'Payfair'),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context) {
    // Here you can implement your sign-in logic,
    // such as validating the email and password and authenticating the user.
    // For simplicity, let's just print the email and password to the console.
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');

    // After successful sign-in, you can navigate to the desired page.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppNavigationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sign-in-update-1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),

          ),
          // "Sign In" text
          Padding(
            padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
            child: Text(
              'Marhaba! Welcome back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Payfair-italic',
              ),
            ),
          ),
          // Sign-in Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'Payfair',
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Payfair',
                          ),
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      signIn(context);
                    },
                    child: Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF1C5C5),
                      textStyle: TextStyle(color: Colors.white, fontFamily: 'Payfair'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/altruism-blanc-fair.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                ],
              ),
              SizedBox(height: 30.0),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                color: Color(0xB5DA4643),
              ),
              SizedBox(height: 150.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0x84DE7B79),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Let me introduce you to your instructors',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Payfair'),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/zouba.jpg'),
                                radius: 50.0,
                              ),
                              SizedBox(width: 20.0),
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/amenii.jpg'),
                                radius: 50.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'We are excited to have you join us!',
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'Payfair'),
                          ),
                          SizedBox(height: 20.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/sign-language-removebg-preview.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Sign Language Detection for Inclusive Communication!',
                                    style: TextStyle(fontSize: 14.0, fontFamily: 'Payfair'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/premium-removebg-preview (1).png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Elevate Your Experience with Premium Membership!',
                                    style: TextStyle(fontSize: 14.0, fontFamily: 'Payfair'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppNavigationPage()),
                        );
                      },
                      child: Text('Continue'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xB5DA4643),
                        textStyle: TextStyle(color: Colors.white, fontFamily: 'Payfair'),
                      ),
                    ),
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

class AppNavigationPage extends StatefulWidget {
  @override
  _AppNavigationPageState createState() => _AppNavigationPageState();
}

class _AppNavigationPageState extends State<AppNavigationPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // Set your desired height
        child: AppBar(
          automaticallyImplyLeading: false, // To remove the default back button
          backgroundColor: Color(0xFFF1C5C5), // Make the AppBar transparent
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/test-black.png"), // Replace with your image path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle the selected option
              if (result == 'Tips') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TipsPage()),
                );
              } else if (result == 'About Us') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('About Us'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to NameApp! We are a team of two passionate individuals, Ameni Laifi and Zaineb Souissi, currently studying at the National School of Computer Science. [Your App Name] is a project born out of our shared enthusiasm for technology and our commitment to making a positive impact through innovation.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Our Journey',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'As students at the National School of Computer Science, we have been immersed in the world of technology and software development. Throughout our academic journey, we have honed our skills in programming, design, and problem-solving, preparing us for real-world projects like NameApp.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Our Vision',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Our vision for NameApp is to create a user-friendly and accessible platform for learning sign language. We believe that everyone should have the opportunity to learn and communicate effectively, regardless of their abilities or background. By harnessing the power of technology, we aim to break down barriers and promote inclusivity in communication.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Why Sign Language?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sign language is a beautiful and expressive form of communication used by millions of people around the world. However, it is often overlooked in mainstream education and technology. With NameApp, we want to shine a spotlight on sign language and empower individuals to learn, communicate, and connect with others in meaningful ways.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Our Commitment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'At NameApp, we are committed to excellence in everything we do. From the design of our app to the accuracy of our sign language recognition feature, we strive for perfection. We value feedback from our users and are dedicated to continuously improving and evolving our platform to meet the needs of our community.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Get in Touch',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'We are excited to embark on this journey with you and invite you to join us in making sign language more accessible to all. If you have any questions, suggestions, or feedback, please don\'t hesitate to reach out to us. Together, we can make a difference!',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Thank you for choosing NameApp.',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Warm regards,',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Ameni Laifi & Zaineb Souissi',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'NameApp Team',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              } else if (result == 'Help') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Help'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to NameApp - Your Sign Language Learning Companion!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'At NameApp, we\'re dedicated to providing you with innovative tools to enhance your sign language learning experience. Our app offers a unique feature: sign language recognition using your device\'s camera or uploaded pictures.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'How does it work?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Our sign language recognition feature utilizes advanced image processing technology to analyze signs captured by your device\'s camera or uploaded pictures. The app identifies the gestures and translates them into text or visual representations, allowing you to learn and practice sign language more effectively.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Key Benefits:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '- Real-time Recognition: Practice sign language anytime, anywhere with real-time recognition using your device\'s camera.',
                            ),
                            Text(
                              '- Enhanced Learning: Receive instant feedback on your signing accuracy, helping you identify areas for improvement.',
                            ),
                            Text(
                              '- Flexible Learning: Whether you\'re a beginner or an advanced signer, our app adapts to your skill level and provides tailored learning experiences.',
                            ),
                            Text(
                              '- Accessible: Our app is designed to be accessible to all users, regardless of their level of sign language proficiency or technological expertise.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'How to Use:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Camera Recognition: Simply point your device\'s camera at the signer or yourself, and our app will recognize the signs in real-time. Practice along with the visual feedback provided.',
                            ),
                            Text(
                              'Picture Recognition: Upload pictures of sign language gestures or signs, and our app will analyze them to provide feedback and suggestions for improvement.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Tips for Success:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '- Ensure good lighting and clear visibility of signs when using the camera recognition feature.',
                            ),
                            Text(
                              '- Take clear and well-lit pictures for optimal results with picture recognition.',
                            ),
                            Text(
                              '- Practice regularly to improve your sign language skills and proficiency.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Privacy and Security:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Your privacy and security are our top priorities. All data processed by our sign language recognition feature is handled securely and in accordance with our privacy policy. We do not store any images or recordings without your consent.',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Get Started Today:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Ready to take your sign language learning journey to the next level? Dive into the world of sign language recognition with NameApp and start communicating with confidence!',
                            ),
                            SizedBox(height: 10),
                            Text(
                              'If you have any questions or need assistance, don\'t hesitate to contact our support team.',
                            ),
                            Text(
                              'Happy signing!',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'NameApp Team',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Tips',
                child: Text('Tips'),
              ),
              PopupMenuItem<String>(
                value: 'About Us',
                child: Text('About Us'),
              ),
              PopupMenuItem<String>(
                value: 'Help',
                child: Text('Help'),
              ),
            ],
          ),
        ],

    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(70),
    ),
    ),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/altruism-blanc-fair.png"), // Change to your image path
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Wrap the button with a Container
                width: 550, // Set a fixed width for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to camera detection page
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF1C5C5),
                    padding: EdgeInsets.zero, // Remove padding to control button size
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Adjust padding as needed
                          child: Text(
                            'Detect Tunisian Signs with your Camera',
                            style: TextStyle(fontSize: 24.0, fontFamily: 'Payfair', color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/detection-removebg-preview.png', // Replace with your image path
                        height: 180, // Adjust image size as needed
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Increase vertical space between buttons
              Container( // Wrap the button with a Container
                width: 550, // Set a fixed width for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to learn Tunisian sign language page
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF1C5C5),
                    padding: EdgeInsets.zero, // Remove padding to control button size
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Adjust padding as needed
                          child: Text(
                            'Explore the World of Tunisian Sign Language',
                            style: TextStyle(fontSize: 24.0, fontFamily: 'Payfair', color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/learn-removebg-preview.png', // Replace with your image path
                        height: 180, // Adjust image size as needed
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF1C5C5),
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Adjust height as needed
        child: AppBar(
          automaticallyImplyLeading: false, // Remove back arrow button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Circular corners
            ),
          ),
          backgroundColor: Colors.orange[300], // Background color
          title: Text(
            'Real time detection',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0, // Increase font size as needed
            ),
          ),
          centerTitle: true, // Center the title
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cameravf-removebg-preview.png',
              height: 500,
              width: 500,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to camera detection page or integrate your AI model here
                // Example: Navigator.pushNamed(context, '/camera_detection');
                // Or integrate your AI model function here
                // Example: performCameraDetection();
              },
              child: Text('Detection with Camera'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[300],
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 32),
                          SizedBox(width: 8),
                          Text(
                            'User Info',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Email: example@example.com\nMembership: Premium\nName: toutou',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to edit profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                    child: Text('Edit'),
                  ),

                ],
              ),
            ),

            // Second Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.privacy_tip, size: 32),
                      SizedBox(width: 8),
                      Text(
                        'Privacy and Legal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Navigate to terms and conditions page
                    },
                    child: Text('Terms and Conditions'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Navigate to privacy policy page
                    },
                    child: Text('Privacy Policy'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add delete account functionality
                    },
                    child: Text('Delete Account'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
            ),

            // Third Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.more_horiz, size: 32),
                      SizedBox(width: 8),
                      Text(
                        'Other',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Add go premium functionality
                    },
                    child: Text('Go Premium'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add give feedback functionality
                    },
                    child: Text('Give Feedback'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add log out functionality
                    },
                    child: Text('Log Out'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
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

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orange[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                _changeName(context);
              },
              child: Text('Change Name'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                _changeEmail(context);
              },
              child: Text('Change Email'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                _changePassword(context);
              },
              child: Text('Change Password'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeName(BuildContext context) {
    TextEditingController newNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Name'),
          content: TextFormField(
            controller: newNameController,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Get the new name entered by the user
                String newName = newNameController.text;

                // Update the displayed name in user info
                setState(() {
                  nameController.text = newName;
                });

                // Do something with the new name (e.g., save it to database)
                // Your implementation here...

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  void _changeEmail(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController newEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: newEmailController,
                decoration: InputDecoration(labelText: 'New Email'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String password = passwordController.text;
                String newEmail = newEmailController.text;

                // Perform password verification logic here
                bool isPasswordCorrect = _verifyPassword(password); // Replace this with your own verification logic

                if (isPasswordCorrect) {
                  // Password is correct, proceed with email change
                  print('New Email: $newEmail');
                  Navigator.of(context).pop();
                } else {
                  // Incorrect password, show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incorrect password.'),
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

// Replace this function with your actual password verification logic
  bool _verifyPassword(String password) {
    // Example: Compare entered password with stored password
    String storedPassword = 'password123'; // Replace with actual stored password
    return password == storedPassword;
  }


  void _changePassword(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Change Password'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: oldPasswordController,
                    decoration: InputDecoration(labelText: 'Old Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: newPasswordController,
                    decoration: InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm New Password'),
                    obscureText: true,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    String oldPassword = oldPasswordController.text;
                    String newPassword = newPasswordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    // Perform password verification logic here
                    bool isOldPasswordCorrect = _verifyOldPassword(oldPassword); // Replace this with your actual verification logic

                    if (isOldPasswordCorrect) {
                      // Old password is correct, proceed with change
                      if (newPassword == confirmPassword) {
                        // Passwords match, proceed with change
                        print('Old Password: $oldPassword');
                        print('New Password: $newPassword');
                        Navigator.of(context).pop();
                      } else {
                        // Passwords do not match, show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('New passwords do not match.'),
                          ),
                        );
                      }
                    } else {
                      // Incorrect old password, show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incorrect old password.'),
                        ),
                      );
                    }
                  },
                  child: Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

// Replace this function with your actual password verification logic
  bool _verifyOldPassword(String password) {
    // Example: Compare entered old password with stored password
    String storedPassword = 'password123'; // Replace with actual stored password
    return password == storedPassword;
  }

}

class TipsPage extends StatelessWidget {
  final List<String> tips = [
    'Use Multimedia Resources: Take advantage of videos, images, and interactive tutorials within the app to learn TSL signs visually. Multimedia resources can help reinforce your understanding of signs and gestures.',
    'Engage with Community: Join online forums, social media groups, or local TSL communities to connect with other learners and native signers. Interacting with others who are learning or fluent in TSL can provide valuable support and practice opportunities.',
    'Pay Attention to Facial Expressions: Remember that facial expressions and body language play a crucial role in TSL communication. Pay close attention to these cues to convey meaning accurately.',
    'Learn in Context: Practice using TSL signs in real-life contexts and scenarios. This will help you understand how signs are used in everyday conversations and interactions.',
    'Seek Feedback: Don\'t hesitate to ask for feedback from teachers, peers, or fluent TSL signers. Constructive feedback can help you identify areas for improvement and refine your signing skills.',
    'Be Patient and Persistent: Learning TSL, like any language, takes time and dedication. Be patient with yourself as you progress and celebrate your achievements along the way.',
    'Respect Deaf Culture: Learn about Tunisian Deaf culture and etiquette to communicate respectfully with the Deaf community. Show appreciation for their language and cultural norms.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sign-in-background.png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: TipsList(tips: tips),
      ),
    );
  }
}

class TipsList extends StatefulWidget {
  final List<String> tips;

  TipsList({required this.tips});

  @override
  _TipsListState createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.tips.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return TipsItem(tip: widget.tips[index], index: index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (_pageController.hasClients && _currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text('${_currentPage + 1}/${widget.tips.length}'),
                IconButton(
                  onPressed: () {
                    if (_pageController.hasClients &&
                        _currentPage < widget.tips.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TipsItem extends StatelessWidget {
  final String tip;
  final int index;

  TipsItem({required this.tip, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/tips-bg.png"), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tip_${index + 1}.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20.0),
            Text(
              tip,
              style: TextStyle(fontSize: 18.0, fontFamily: 'Payfair'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

