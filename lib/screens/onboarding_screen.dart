import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/onboarding_page_content.dart';
import '../widgets/primary_button.dart';
import '../widgets/icon_button_rounded.dart';
import '../widgets/dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  
  // Total number of onboarding pages
  final int _totalPages = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPageIndex < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Login/Home screen
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      // print("Done with onboarding");
    }
  }

  void _onPrevious() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    // Navigate straight to Login/Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      // Skip button at the top right
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _onSkip,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            child: const Text('Skip'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // PageView takes up the majority of the screen
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: const [
                OnboardingPageContent(
                  // Placeholder for PC illustration
                  image: Icon(Icons.computer, size: 200, color: AppColors.darkBackground),
                  title: 'Build Your Masterpiece',
                  description: 'From hardcore gaming to professional\nediting, design a PC that matches\nyour ambition.',
                ),
                OnboardingPageContent(
                  // Placeholder for Scooter illustration
                  image: Icon(Icons.electric_scooter, size: 200, color: AppColors.darkBackground),
                  title: 'Shop Unique Gadgets',
                  description: 'Upgrade your everyday with a\ncurated selection of innovative tech\nand must-have gadgets.',
                ),
                OnboardingPageContent(
                  // Placeholder for 3rd feature
                  image: Icon(Icons.shopping_bag, size: 200, color: AppColors.darkBackground),
                  title: 'Seamless Shopping',
                  description: 'Enjoy a fast, secure, and hassle-free\ncheckout experience designed for you.',
                ),
                OnboardingPageContent(
                  // Placeholder for 4th feature
                  image: Icon(Icons.rocket_launch, size: 200, color: AppColors.darkBackground),
                  title: 'Ready To Launch',
                  description: 'Sign in to start exploring the best\nproducts curated just for you.',
                ),
              ],
            ),
          ),

          // Bottom section with DotIndicator and Navigation Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              children: [
                DotIndicator(
                  dotCount: _totalPages,
                  activeIndex: _currentPageIndex,
                ),
                const SizedBox(height: 32),

                // Show "Get Started" for full-width on page 0
                // For page 1+, show "<" and "Next" side by side
                if (_currentPageIndex == 0)
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: _onNext,
                          label: 'Get Started',
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButtonRounded(
                        onPressed: _onNext,
                        icon: Icons.chevron_right,
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      IconButtonRounded(
                        onPressed: _onPrevious,
                        icon: Icons.chevron_left,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: _onNext,
                          label: _currentPageIndex == _totalPages - 1 ? 'Finish' : 'Next',
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}