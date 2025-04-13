import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hrms/data/model/getNewRoutePlanResponse.dart';

import 'edit_route_plan_screen.dart';

class RoutePlanListScreen extends StatelessWidget {
  final List<RouteReturnId> routePlanList;
   const RoutePlanListScreen({super.key, required this.routePlanList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Plan List'),
        actions: [
          Padding(
            padding:  const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                if (routePlanList.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditRoutePlanScreen(
                        routePlanList: routePlanList,selectedDate: DateTime.parse(routePlanList[0].date.toString()),
                      ),
                    ),
                  );
                }
              },
              child: const Icon(Icons.edit, color:Colors.blue,),
            ),
          ),
        ],
      ),
      body: routePlanList.isEmpty
          ? const Center(
        child: Text(
          'No routes available.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: routePlanList.length,
        itemBuilder: (context, index) {
          final route = routePlanList[index];

          if (route.date == null) {
            return const Card(
              child: ListTile(
                title: Text('Date not available'),
                subtitle: Text('Route details are missing.'),
              ),
            );
          }

          DateTime createdDate;
          try {
            createdDate = DateTime.parse(route.date.toString());
          } catch (e) {
            return const Card(
              child: ListTile(
                title: Text('Invalid date format'),
                subtitle: Text('Route details are missing or corrupted.'),
              ),
            );
          }

          String formattedDate =
          DateFormat('dd-MMM-yyyy (EEEE)').format(createdDate);

          if (route.routePlanDetails != null &&
              route.routePlanDetails!.isNotEmpty) {
            final routeDetail = route.routePlanDetails![0];

            return Card(
              child: ListTile(
                title: Text(
                    '$formattedDate \nRoute: ${routeDetail.routeName.toString()}'),
                subtitle: Text(
                    'Purpose: ${routeDetail.routePurpose}, Sequence: ${routeDetail.sequence}'),
              ),
            );
          } else {
            return Card(
              child: ListTile(
                title: Text('$formattedDate \nRoute: Not Available'),
                subtitle: const Text('Purpose: Not Available, Sequence: Not Available'),
              ),
            );
          }
        },
      ),
    );
  }
}


