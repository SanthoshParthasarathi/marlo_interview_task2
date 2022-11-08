import 'package:flutter/material.dart';
import 'package:marlo_task2/screens/chatscreen.dart';
import 'package:marlo_task2/screens/contractscreen.dart';
import 'package:marlo_task2/screens/firstscreen.dart';
import 'package:marlo_task2/screens/loanscreen.dart';
import 'package:marlo_task2/screens/teamsscreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pageOptions = [
    HomePage(),
    LoanScreen(),
    ContractScreen(),
    TeamsScreen(),
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_sharp),
              title: Text('Loans'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_present),
              title: Text('Contracts'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              title: Text('Teams'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      body: _pageOptions[_selectedIndex],
    );
  }
}
