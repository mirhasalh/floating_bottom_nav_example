import 'package:floating_bottom_nav_example/src/page/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavPage extends StatefulWidget {
  static const routeName = '/';

  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _widgets = const <Widget>[
    HomePage(),
    ExplorePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return _NavPageBody(
      body: _widgets.elementAt(_selectedIndex),
      bottomNavBar: _BottomNavBar(
        selectedIndex: _selectedIndex,
        bottomNavBarItems: <_BottomNavBarItems>[
          _BottomNavBarItems(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          _BottomNavBarItems(
            filledIcon: Icons.explore,
            outlinedIcon: Icons.explore_outlined,
          ),
          _BottomNavBarItems(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_outline,
          ),
          _BottomNavBarItems(
            filledIcon: Icons.settings,
            outlinedIcon: Icons.settings_outlined,
          ),
        ],
        onChanged: setIndex,
      ),
    );
  }

  void setIndex(int index) {
    setState(() => _selectedIndex = index);
  }
}

class _NavPageBody extends StatelessWidget {
  const _NavPageBody({
    required this.body,
    required this.bottomNavBar,
  });

  final Widget body;
  final Widget bottomNavBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Material(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: bottomNavBar,
          )),
        ),
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.selectedIndex,
    required this.bottomNavBarItems,
    required this.onChanged,
  });

  final int selectedIndex;
  final List<_BottomNavBarItems> bottomNavBarItems;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blueGrey,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          bottomNavBarItems.length,
          (index) => SizedBox(
            height: kToolbarHeight,
            width: 60,
            child: RawMaterialButton(
              constraints: const BoxConstraints(minWidth: 0.0),
              onPressed: () => onChanged(index),
              child: Icon(
                index == selectedIndex
                    ? bottomNavBarItems[index].filledIcon
                    : bottomNavBarItems[index].outlinedIcon,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItems {
  _BottomNavBarItems({required this.filledIcon, required this.outlinedIcon});

  final IconData filledIcon;
  final IconData outlinedIcon;
}
