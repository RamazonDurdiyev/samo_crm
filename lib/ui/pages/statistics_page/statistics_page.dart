import 'package:flutter/material.dart';

import 'statistics_bloc.dart';
import 'statistics_event.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = StatisticsBloc();
    return Scaffold(
      appBar: _buildAppBar(context, bloc),
    );
  }

  _buildAppBar(BuildContext context, StatisticsBloc bloc) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.indigo,
      ),
      backgroundColor: Colors.transparent,
      title: const Text(
        "Statistics",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 44),
        child: Column(
          children: [
            _buildCustomDivider(),
            const SizedBox(
              height: 8,
            ),
            _buildFilterTab(bloc),
          ],
        ),
      ),
    );
  }

  _buildFilterTab(StatisticsBloc bloc) {
    return DefaultTabController(
      length: 6,
      initialIndex: bloc.currentIndexOfTab,
      child: TabBar(
        padding: const EdgeInsets.only(left: 16),
        isScrollable: true,
        splashBorderRadius: const BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicator: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              100,
            ),
          ),
          color: Colors.indigo,
        ),
        onTap: (value) {
          bloc.add(
            ChangeStatisticsTabEvent(value: value),
          );
        },
        tabs: const [
          Tab(
            height: 35,
            text: "All",
          ),
          Tab(
            height: 35,
            text: "Tayyor",
          ),
          Tab(
            height: 35,
            text: "Qismlar",
          ),
          Tab(
            height: 35,
            text: "PC",
          ),
          Tab(
            height: 35,
            text: "Tablet",
          ),
          Tab(
            height: 35,
            text: "Phone",
          ),
        ],
      ),
    );
  }

  _buildCustomDivider() {
    return Container(
      height: 1,
      color: Colors.indigo,
    );
  }
}
