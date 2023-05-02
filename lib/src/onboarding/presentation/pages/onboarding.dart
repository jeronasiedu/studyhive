import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../generated/assets.dart';
import '../../../../shared/ui/custom_bottomsheet.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final walkthrough = [
    WalkThrough(
      title: 'Collaborate with other students',
      description:
          'Connect with classmates to form study groups and share ideas, discuss difficult concepts, and learn from each other.',
      image: Assets.assetsImage2,
    ),
    WalkThrough(
      title: 'Better learning recommendations',
      description:
          'Receive personalized learning recommendations based on your learning style and goals to improve your academic performance.',
      image: Assets.assetsImage1,
    ),
    WalkThrough(
      title: 'Keep track of your tasks and deadlines',
      description:
          'Manage your assignments, tasks, and deadlines with ease by creating to-do lists, tracking your progress, and receiving reminders.',
      image: Assets.assetsImage3,
    ),
  ];
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentPage = 0;
  double _pageOffset = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onButtonTapped() {
    if (_currentPage != walkthrough.length - 1) {
      handleProgress(ProgressOption.next);
      _pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    } else {
      showCustomBottomSheet(
        height: Get.height * 0.37,
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'Welcome to Study Hive!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                  'We are excited to have you join our community of students. Let\'s get started!',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  label: const Text("Continue with Google"),
                  icon: const Icon(Ionicons.logo_google),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 15),
                child: SizedBox(
                  width: Get.width * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    label: const Text("Continue with Phone"),
                    icon: const Icon(IconlyBold.call),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    text: "By creating an account, you agree to Study Hive's ",
                    children: [
                      TextSpan(
                        text: "terms and conditions",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      );
      // Get.offAllNamed(AppRoutes.HOME);
    }
  }

  void handleProgress(ProgressOption option) {
    double percentageIncrease = 1 / (walkthrough.length - 1);
    double updatedValue = option == ProgressOption.next
        ? _animation.value + percentageIncrease
        : _animation.value - percentageIncrease;
    _controller.animateTo(
      updatedValue,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, bottom: 10),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: walkthrough.length,
            onPageChanged: (index) {
              setState(() {
                if (index > _currentPage) {
                  // User swiped left
                  handleProgress(ProgressOption.next);
                  _currentPage = index;
                } else if (index < _currentPage) {
                  handleProgress(ProgressOption.previous);
                  // User swiped right
                  _currentPage = index;
                  // Do something else
                }
              });
            },
            itemBuilder: (context, index) {
              final walkThrough = walkthrough[index];
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_pageOffset - index),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        walkThrough.image,
                        width: 350,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      walkThrough.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      walkThrough.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: _animation.value,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.15),
              strokeWidth: 3.5,
            ),
          ),
          FloatingActionButton(
            onPressed: _onButtonTapped,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _currentPage == walkthrough.length - 1
                      ? const Icon(
                          IconlyBold.add_user,
                          key: ValueKey('check'),
                        )
                      : const Icon(
                          IconlyBold.arrow_right,
                          key: ValueKey('arrow'),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThrough {
  final String title;
  final String description;
  final String image;

  WalkThrough({
    required this.title,
    required this.description,
    required this.image,
  });
}

enum ProgressOption { next, previous }
