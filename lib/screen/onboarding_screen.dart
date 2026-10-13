import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:worldtravel/screen/login_screen.dart';

class OnbordingItem {
  final String title;
  final String image;

  OnbordingItem({required this.title, required this.image});
}

final List<OnbordingItem> onboardingItems = [
  OnbordingItem(
    image: 'asset/images/Saly-1.png',
    title: 'Discover the world with us',
  ),
  OnbordingItem(
    image: 'asset/images/Saly-44.png',
    title: 'To the most famous places of the world',
  ),
  OnbordingItem(
    image: 'asset/images/Saly-3.png',
    title: 'With cheap and affordable prices',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(onboardingItems[index].image, width: 280),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          onboardingItems[index].title,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            onboardingItems.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 8,
                              width: _currentPage == index ? 20 : 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? const Color(0xFFFF4B4B)
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          if (_currentPage < onboardingItems.length - 1) {
                            _currentPage++;
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 200),
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
