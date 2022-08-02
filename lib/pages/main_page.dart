import 'package:flutter/material.dart';
import 'package:river_pod_example/pages/better_player_test.dart';
import 'package:river_pod_example/utils/color_utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreens[currentIndex],
      bottomNavigationBar: SafeArea(
        child: _buildNavBar(),
      ),
    );
  }

  Widget _buildNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      // backgroundColor: ColorUtils.disableColor,
      selectedItemColor: ColorUtils.primaryColor,
      // unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      // unselectedLabelStyle: llNavBarText,
      // selectedLabelStyle: llNavBarText,
      onTap: selecteIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rectangle),
          label: 'Toolkit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: 'Update',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: 'Publications',
        ),
      ],
    );
  }

  selecteIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> buildScreens = [
    MyVideoTest(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
}
