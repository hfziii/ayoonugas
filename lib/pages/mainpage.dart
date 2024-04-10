import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appayoonugas/pages/category_page.dart';
import 'package:appayoonugas/pages/homepage.dart';
import 'package:appayoonugas/pages/addtask.page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CateoryPage()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0) ? CalendarAppBar(
        backButton: false,
        accent: Colors.blueGrey,
        locale: 'id',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ) : PreferredSize(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: Text(
              'Mata Pelajaran',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: SafeArea(
        child: _children[currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: Icon(
                Icons.logout_outlined,
              ),
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: Icon(Icons.edit_note),
              color: Colors.white,
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
