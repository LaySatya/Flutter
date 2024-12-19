import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/carousel_images.dart';
import '../screens/search_screen.dart';
import '../widgets/course_category.dart';
import './courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.appLogo});
  final String appLogo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          appLogo,
          fit: BoxFit.contain,
          height: 100,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Welcome back 🤗',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              items: [
                for (int i = 0; i < carouselImages.length; i++)
                  Image.asset(
                    carouselImages[i],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
              ],
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Courses',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CoursesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
        
            // Course Cards
            LayoutBuilder(
              builder: (context, constraints) {
                return const CoursesCard();
              },
            ),
            const SizedBox(height: 20),
            // Course Categories
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(

            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue[800],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.play_lesson_sharp),
            label: 'Courses',
            backgroundColor: Colors.blue[800],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue[800],
          ),
          
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(appLogo: appLogo)),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CoursesScreen()),
            );
          } else if (index == 2) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SettingsPage()),
            // );
          }
        }
      ),
    );
  }
}
