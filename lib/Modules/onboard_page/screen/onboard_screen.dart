import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_app/Modules/home_page/screen/home_page.dart';
import 'package:open_weather_app/functions/fade.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    // for the animation controllers of the extra text
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // for the animation controllers of the Today textb
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5),
      ),
    );
// for the sliding fuction of the today text
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -6),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 1.0),
      ),
    );
// for the automatic transition of the new route
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).push(
          CustomPageRoute(HomePage()),
        );
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      _animationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // fading transition of the extra text
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Text(
                  "what is ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 194, 194, 194),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // fading transition of the extra text
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Text(
                  "the weather like ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 194, 194, 194),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // sliding transition from the place to the up
              SlideTransition(
                position: _slideAnimation,
                child: const Text(
                  "today ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
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
