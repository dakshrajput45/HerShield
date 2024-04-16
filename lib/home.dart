import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key}); // Pass key to super constructor

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;
  String topTitle = "Shield";
  String buttonName = 'Help';
  Color buttonColor = Colors.red;
  String afterClickHelp = 'Click to get Help';

  Widget buildHomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200, // Adjust image width
            height: 200, // Adjust image height
            child: Image.asset('images/logo.png'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button press
              setState(() {
                buttonName = 'Medical';
                afterClickHelp = 'Click to get Medical Help';
                buttonColor = Colors.blueAccent;
              });
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 200), // Adjust button size as needed
              backgroundColor:
                  buttonColor, // Change button background color to red
              foregroundColor: Colors.white, // Change text color to white
            ),
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Text(
            afterClickHelp,
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              topTitle,
              style: const TextStyle(color: Colors.black,
              ),
            ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
            child: currentIndex == 1
                ? buildHomeScreen()
                : currentIndex == 0
                    ? const BuildCommunityScreen()
                    : const BuildProfileScreen()),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                label: 'Feed',
                icon: SizedBox(
                  width: 30, // Adjust image width
                  height: 30, // Adjust image height
                  child: Image.asset('images/community.png'),
                )),
            BottomNavigationBarItem(
                label: 'HOME',
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("images/home.png"),
                )),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset("images/account.png"),
              ),
            )
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              topTitle = currentIndex == 2
                  ? "Profile Section"
                  : currentIndex == 0
                      ? "Community Page"
                      : "Shield";
            });
          },
        ),
    );
  }
}
class BuildCommunityScreen extends StatelessWidget {
  const BuildCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class BuildProfileScreen extends StatelessWidget {
  const BuildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: <Widget>[
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'images/aboutus-icon.png', // Replace 'images/aboutus-icon.png' with your image asset path
                    width: 24, // Adjust the width of the image
                    height: 24, // Adjust the height of the image
                  ),
                  const SizedBox(width: 8), // Add spacing between icon and text
                  const Text('About us'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'About Us Page',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'This is a simple About Us page.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}