

3. CODE CHÍNH CỦA BOTTOM NAVIGATION BAR VÀ MÀN HÌNH ĐƯỢC PHÂN CÔNG:

import 'package:flutter/material.dart';

void main() {
  runApp(const PhenikaaApp());
}

class PhenikaaApp extends StatelessWidget {
  const PhenikaaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App with Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainNavigationScreen(),
    );
  }
}

// 1. CODE CHÍNH CỦA BOTTOM NAVIGATION BAR
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    DetailScreen(),
    ContactScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Detail',
          ),
        ],
      ),
    );
  }
}

// 2. CODE CHÍNH CỦA MÀN HÌNH TRANG CHỦ & CÁC MÀN HÌNH LIÊN QUAN
const String groupImageUrl = 'https://i.postimg.cc/CxRT9JpX/Screenshot-2026-09-26-105837.png';

Widget _buildPhenikaaHeader() {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(16),
decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        const Text(
          'PHENIKAA\nUNIVERSITY',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.indigo,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(groupImageUrl),
        ),
      ],
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1 : Home')),
      body: Column(
        children: [
          _buildPhenikaaHeader(),
          const Expanded(
            child: Center(
              child: Text('My Home Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}