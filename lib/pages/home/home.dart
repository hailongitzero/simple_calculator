import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/components/button/logout_icon.dart';

class HomePage extends StatefulWidget {
  static const title = 'Home';
  static const homeIcon = Icon(CupertinoIcons.home);
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  String dropdownValue = 'Jarkata'; // Initial dropdown value

  Widget _buildBody() {
    return const SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Left side - Dropdown
              SizedBox(width: 8.0),
              // Right side - Notification Icon
              Icon(
                Icons.notifications,
                color: Colors.blue,
                size: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: homeKey,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Home'),
        trailing: LogoutIconButton(),
        previousPageTitle: '',
      ),
      child: _buildBody(),
    );
  }
}
