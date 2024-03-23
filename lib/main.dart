import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Sample username and password for demonstration
    if (username == 'user' && password == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenu(username: username)),
      );
    } else {
      _showDialog('Invalid Username or Password! Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in your Account',
            style: GoogleFonts.play(color: Colors.white)
        ), // Set app bar text color to white
        centerTitle: true,
        backgroundColor: Colors.black, // Set app bar background color to black
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Menu icon with white color
          onPressed: () {
            // Add onPressed callback for menu icon
            // You can add functionality to open a drawer or show a menu here
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.redd.it/uz3stskbjvr91.png'), // Replace 'https://example.com/background.jpg' with your image URL
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50), // Adjust top padding to move the image lower
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50), // Adjust border radius to make it circular
                        child: Image.network(
                          'https://scontent.fmnl25-4.fna.fbcdn.net/v/t1.15752-9/432574812_1079491786640163_5380145124065660251_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEa18NokXs-ODKd2Ta8xkvDEKkDqgDD840QqQOqAMPzjQsGGnlY3_2Mxrnu-Tsg56XHZSjFRlibVrozI_VsV1W_&_nc_ohc=fYtekxULv-oAX9hT-Dj&_nc_ht=scontent.fmnl25-4.fna&oh=03_AdTQteqbeN8MSpYiJnJJXkfPZudzAt9S5BR4uCHeRbpumw&oe=66260E20', // Your circular image asset
                          width: 100, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set background color to white
                            borderRadius: BorderRadius.circular(100.0), // Set border radius
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            style: GoogleFonts.play(color: Colors.black), // Set text color to black
                            decoration: InputDecoration(
                              hintText: 'Username', // Add hintText instead of labelText
                              hintStyle: GoogleFonts.play(color: Colors.grey, fontSize: 15), // Set hint text color to black
                              prefixIcon: const Icon(Icons.person, color: Colors.black), // Set icon color to black
                              border: InputBorder.none, // Remove the default border
                              // Use OutlineInputBorder for custom border
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0), // Set rounded border radius
                                borderSide: const BorderSide(color: Colors.black), // Set border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0), // Set rounded border radius
                                borderSide: const BorderSide(color: Colors.black), // Set border color
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // Add some spacing between fields
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set background color to white
                            borderRadius: BorderRadius.circular(100.0), // Set border radius
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            style: GoogleFonts.play(color: Colors.black), // Set text color to black
                            decoration: InputDecoration(
                              hintText: 'Password', // Add hintText instead of labelText
                              hintStyle: GoogleFonts.play(color: Colors.grey, fontSize: 15), // Set hint text color to black
                              prefixIcon: const Icon(Icons.lock, color: Colors.black), // Set icon color to black
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.black, // Set icon color to black
                                ),
                              ),
                              border: InputBorder.none, // Remove the default border
                              // Use OutlineInputBorder for custom border
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0), // Set rounded border radius
                                borderSide: const BorderSide(color: Colors.black), // Set border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0), // Set rounded border radius
                                borderSide: const BorderSide(color: Colors.black), // Set border color
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                            ),
                            obscureText: !_isPasswordVisible,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Set button background color to red
                            ),
                            child: Text('LOGIN',
                            style: GoogleFonts.play(color: Colors.white, fontSize: 15),
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
        ],
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  final String username;

  const MainMenu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Group D',
          style: GoogleFonts.play(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.15752-9/432162521_397646426329660_773526711111065723_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFLxdojxP8inuop4ttqx0aUwP4Z-9PQudPA_hn709C50-qOtGH7639d5ZCVGbGFm-MQYMoY_Y5ynSmKeijI34Mj&_nc_ohc=Kkd1oLUgdnkAX_nj-v8&_nc_ht=scontent.fmnl4-6.fna&oh=03_AdQg9z4DPIRz8njEI4vX7p4A7_G3orvPr6Pweh8YopY5jw&oe=66265BB0'), // Replace with your image URL
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Project',
                  style: GoogleFonts.pressStart2p(fontSize: 25, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Compilation',
                  style: GoogleFonts.pressStart2p(fontSize: 25, color: Colors.green),
                ),
              ),
              const SizedBox(height: 100), // Adjust the space between the texts and the buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CounterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color of the button
                    ),
                    child: Text('Increment/Decrement',
                    style: GoogleFonts.play(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const _CaptchaTypingScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color of the button
                    ),
                    child:  Text('Captcha Typing',
                      style: GoogleFonts.play(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our First Android App',
          style: GoogleFonts.play(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://w0.peakpx.com/wallpaper/134/718/HD-wallpaper-super-mario-games-mario-mario-kart-super-super-mario-super-mario-bros-thumbnail.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: GoogleFonts.pressStart2p(
                  color: Colors.white, fontSize: 100, height: -1),
            ),
            Text(
              "Group D",
              style: GoogleFonts.play(color: Colors.white54, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Icon(Icons.restore),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CaptchaTypingScreen extends StatefulWidget {
  const _CaptchaTypingScreen();

  @override
  _CaptchaTypingScreenState createState() => _CaptchaTypingScreenState();
}

class _CaptchaTypingScreenState extends State<_CaptchaTypingScreen> {
  String generatedCode = '';
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateCode();
  }

  void generateCode() {
    final random = Random();
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    generatedCode = String.fromCharCodes(Iterable.generate(6, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  void checkCode(String input) {
    if (input == generatedCode) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You input a correct code!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  generateCode(); // Generate a new code
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Code'),
            content: const Text('Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Captcha Typing',
          style: GoogleFonts.headlandOne(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://www.pixel4k.com/wp-content/uploads/2019/10/super-mario-nintendo_1572370059.jpg'), // Replace 'background_image.jpg' with your image asset path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 30.0), // Add margins
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              generatedCode,
              style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(height: 5.0), // Add some space between generated code and header line
            const Divider(
              color: Colors.white,
            ), // Add a divider as a header line
            const SizedBox(height: 5.0), // Add some space between header line and "Group D" text
            Text(
              'Group D',
              style: GoogleFonts.playfair(fontSize: 20.0, color: Colors.white70),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0), // Adjust the bottom padding as needed
                  child: TextField(
                    controller: _textEditingController,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: GoogleFonts.play(color: Colors.black, fontSize: 17.5),
                    decoration: InputDecoration(
                      hintText: 'Enter the code',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.lightGreen,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0), // Set border radius here
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0), // Set border radius here
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0), // Set border radius here
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0), // Adjust padding here
                    ),
                    onChanged: (value) {
                      // You can perform validation here if needed
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String userInput = _textEditingController.text.trim(); // Get user input
                  checkCode(userInput);
                },
                child: const Text('SUBMIT'),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  generateCode();
                  setState(() {}); // Refresh UI
                },
                child: const Text('GENERATE ANOTHER KEY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}