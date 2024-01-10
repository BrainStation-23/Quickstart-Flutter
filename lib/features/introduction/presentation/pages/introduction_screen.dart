import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/features/introduction/presentation/widgets/placeholder_widget.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int currentIndex = 0;
  late PageController _pageController;
  final _pageList = [
    const PlaceholderWidget(),
    const PlaceholderWidget(),
    const PlaceholderWidget(),
    const PlaceholderWidget(),
  ];
  late int _pageCount = _pageList.length;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageCount = _pageList.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _pageController,
              itemCount: _pageCount,
              itemBuilder: (_, index) => _pageList[index],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pageCount,
              (index) => _buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == _pageCount - 1) {
                  context.goNamed(Routes.signIn);
                }
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInCubic,
                );
              },
              child: Text(currentIndex == _pageCount - 1 ? "Continue" : "Next"),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer _buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
