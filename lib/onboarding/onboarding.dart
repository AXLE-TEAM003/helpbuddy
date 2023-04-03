import 'package:flutter/material.dart';
final PageController controller = PageController();
final PageView pageView = PageView(
  controller: controller,
  children: const <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ],
);

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Page 3'),
      ),
    );
  }
}

int currentPage = 0;

Widget _buildDotIndicator(int currentIndex) {
  List<Widget> dots = [];
  for (int i = 0; i < 3; i++) {
    dots.add(
      Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == currentIndex
              ? Colors.indigo
              : Colors.indigo.withOpacity(0.2),
        ),
      ),
    );
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: dots,
  );
}



@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          pageView,
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              child: Center(
                child: _buildDotIndicator(currentPage),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              child: const Center(
                child:
            
                  Text(
                    'Get Started',
                    style: TextStyle(
                      color : Colors.indigo,
fontWeight: FontWeight.bold,
),
),

),
),
),
],
),
);
}


