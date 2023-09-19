import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: _buildBody(context),
    );
  }

  //

  _buildDrawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 41, 49, 106),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            accountName: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              'johndoe@example.com',
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_2,
                size: 32,
                color: Colors.indigo,
              ),
              // backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenUtil().statusBarHeight + 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            children: [
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    Icons.analytics,
                    size: 50,
                    color: Colors.indigo,
                  ),
                );
              }),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Samo Techno",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const Icon(
                Icons.notifications,
                color: Colors.indigo,
                size: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
