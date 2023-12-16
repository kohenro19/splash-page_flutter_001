import 'package:flutter/material.dart';

class PageViewModel {
  String title;
  String description;
  Color backgroundColor;
  IconData icon;

  PageViewModel({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.icon,
  });
}

class OnboardingPage extends StatelessWidget {
  final PageViewModel viewModel;

  OnboardingPage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: viewModel.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              viewModel.icon,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              viewModel.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              viewModel.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      backgroundColor: Colors.blue,
      icon: Icons.ac_unit,
    ),
    PageViewModel(
      title: 'Explore',
      description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      backgroundColor: Colors.green,
      icon: Icons.explore,
    ),
    PageViewModel(
      title: 'Enjoy',
      description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      backgroundColor: Colors.orange,
      icon: Icons.favorite,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(viewModel: pages[index]);
        },
      ),
    );
  }
}
