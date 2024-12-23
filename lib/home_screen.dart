import 'package:flutter/material.dart';
import 'package:simple_beautiful_checklist_exercise/features/statistics/screens/statistics_screen.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

import 'features/task_list/screens/list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.repository,
    required this.toggleTheme,
    required this.isDarkTheme,
  });

  final DatabaseRepository repository;
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavBarIndex = 0;
  List<Widget> _navBarWidgets = [];
  final List<String> _titles = ['Meine Checkliste', 'Task-Statistik'];

  @override
  void initState() {
    super.initState();
    _navBarWidgets = [
      ListScreen(repository: widget.repository),
      StatisticsScreen(repository: widget.repository),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_navBarWidgets.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedNavBarIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(
              widget.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: _navBarWidgets[_selectedNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Aufgaben',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Statistik',
          ),
        ],
        currentIndex: _selectedNavBarIndex,
        selectedItemColor: Colors.deepPurple[200],
        onTap: (int index) {
          setState(() {
            _selectedNavBarIndex = index;
          });
        },
      ),
    );
  }
}
