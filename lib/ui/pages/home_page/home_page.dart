import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samo_crm/ui/pages/notification_page/notification_page.dart';
import 'package:samo_crm/ui/pages/profile_settings/profile_settings_page.dart';
import 'package:samo_crm/ui/pages/settings_page/settings_page.dart';
import 'package:samo_crm/ui/pages/sign_up_page/sign_up_page.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      body: _buildBody(context),
    );
  }

  _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.indigo),
            accountName: const Text(
              'Hamroyev Shavkat',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            accountEmail: Row(
              children: [
                const Text(
                  'Shavkat3245@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ProfileSettings();
                        },
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            currentAccountPicture: const CircleAvatar(
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
              color: Colors.indigo,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.indigo,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingsPage();
                  },
                ),
              );
            },
          ),
          const Divider(
            color: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.indigo,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text(
                      "Log out?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      "Are you sure to log out your account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ), (route) => false);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      size: 40,
                      color: Colors.indigo,
                    ),
                  );
                }),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Samo Techno",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NotificationPage();
                        },
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.indigo,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 1,
            color: Colors.indigo,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Analytics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              elevation: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        height: 100,
                        child: LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(show: false),
                            borderData: FlBorderData(
                              show: false,
                              border: Border.all(
                                  color: const Color(0xff37434d), width: 1),
                            ),
                            minX: 0,
                            maxX: 6,
                            minY: 0,
                            maxY: 10,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  const FlSpot(0, 9),
                                  const FlSpot(1, 4),
                                  const FlSpot(2, 10),
                                  const FlSpot(3, 2),
                                  const FlSpot(4, 4),
                                  const FlSpot(5, 4),
                                  const FlSpot(6, 4),
                                ],
                                isCurved: true,
                                color: Colors.red,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.red.withOpacity(0.1)),
                              ),
                              LineChartBarData(
                                spots: [
                                  const FlSpot(0, 4),
                                  const FlSpot(1, 4),
                                  const FlSpot(2, 4),
                                  const FlSpot(3, 7),
                                  const FlSpot(4, 6),
                                  const FlSpot(5, 7),
                                  const FlSpot(6, 8),
                                ],
                                isCurved: true,
                                color: Colors.green,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                    show: true,
                                    color: Colors.green.withOpacity(0.1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildWeeksText("Mon"),
                        _buildWeeksText("Tue"),
                        _buildWeeksText("Wed"),
                        _buildWeeksText("Thu"),
                        _buildWeeksText("Fri"),
                        _buildWeeksText("Sat"),
                        _buildWeeksText("Sun"),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildServicesGrid(context),
        ],
      ),
    );
  }

  _buildWeeksText(String weekDay) {
    return Expanded(
      child: Text(
        weekDay,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildServicesGrid(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 3,
      ),
      children: [
        _serviceButton(
          context,
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          "Omborga mahsulot kiritish",
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const SettingsPage();
          //     },
          //   ),
          // ),
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.remove,
            color: Colors.white,
          ),
          "ombordagi mahsulotni chiqarish",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          "Omborda mavjud mahsulotlar",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          "Yaroqsiz mahsulotlar",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.history,
            color: Colors.white,
          ),
          "Kirim chiqim tarixi",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.people,
            color: Colors.white,
          ),
          "Hodimlarni tayinlash",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.library_books,
            color: Colors.white,
          ),
          "KPI amallari",
          const WarehouseInPage(),
        ),
        _serviceButton(
          context,
          const Icon(
            Icons.check_box,
            color: Colors.white,
          ),
          "Mahsulotlarni tasdiqlash",
          const WarehouseInPage(),
        ),
      ],
    );
  }

  _serviceButton(
    BuildContext context,
    Icon icon,
    String task,
    page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo,
                ),
                child: icon,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      task,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
