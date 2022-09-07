import 'package:flutter/material.dart';
// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() {
  runApp(const MyApp());
}
// В Flutter все является виджетом (кнопки,списки, текст и т.д.)
// виджет - это отдельный компонент, который может быть отрисован
// на экране (не путать с Android виджетами)
// Наиболее простые виджеты наследуются от StatelessWidget класса
// и не имеют состояния
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// функция build отвечает за построение иерархии виджетов
  @override
  Widget build(BuildContext context) {
    // виджет MaterialApp - главный виджет приложения, который
    // позволяет настроить тему и использовать
    // Material Design для разработки.
    return MaterialApp(
      // заголовок приложения
      // обычно виден, когда мы сворачиваем приложение
      title: 'GeoMemory',
      theme: ThemeData(
        // настройка темы, мы ещё вернёмся к этому
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),// указываем исходную страницу, которую мы создадим позже
      home: Scaffold(
        body: CustomPaint(
          size: Size.infinite,
          painter: MapPainter(),
        ),
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var points = [
      Offset(1, 1),
      Offset(1, 0.5),
      Offset(1, 1),
      Offset(1, 1)
    ];
    var matrix = Matrix4.identity();
    matrix.scale(size.width, size.height);
    canvas.transform(matrix.storage);
    path.addPolygon(points, true);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.blue
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
