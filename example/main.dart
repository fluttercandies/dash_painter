import 'package:dash_painter/dash_painter.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: CustomPaint(
              size: Size(200,200),
              painter: TolyPainter()),
        ),
      ),
    );
  }
}

class TolyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orangeAccent
      ..strokeWidth = 1;

    final Path path = Path();
    path.moveTo(-200, 0);
    path.lineTo(200, 0);
    path.moveTo(0, -200);
    path.lineTo(0, 200);

    path.addOval(Rect.fromCircle(center: Offset.zero, radius: 80));
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromCircle(center: Offset.zero, radius: 100),
      Radius.circular(20),
    ));
    const DashPainter(span: 4, step: 9).paint(canvas, path, paint);
  }

  @override
  bool shouldRepaint(covariant TolyPainter oldDelegate) => false;
}

