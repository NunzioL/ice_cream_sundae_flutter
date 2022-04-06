import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'order.dart';
import 'order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Order> _orders = [];

  void gotoAboutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  void gotoOrderHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderHistory(
          orders: _orders,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          PopupMenuButton(
            onSelected: (choice) {
              if (choice == 'About') {
                gotoAboutScreen();
              } else if (choice == 'Orders') {
                gotoOrderHistory();
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'Orders',
                  child: Text('Orders'),
                ),
                const PopupMenuItem(
                  value: 'About',
                  child: Text('About'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            _orders.add(Order("", 0, ""));
          },
          child: Text('Order'),
        ),
      ),
    );
  }
}
