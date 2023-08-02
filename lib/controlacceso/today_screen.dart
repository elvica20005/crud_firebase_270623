import 'package:flutter/material.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "Bienvenido",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Alumno",
                style: TextStyle(color: Colors.black54, fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "Estado Actual del día",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 30),
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Entrada",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "08:55",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Salida",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "05:30",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: const TextSpan(
                    text: "11",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: " Enero 2023",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "20:00:01",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            // Builder(
            //   builder: (context) {
            //     final GlobalKey<SlideActionState> key = GlobalKey();
            //     return const SlideAction(
            //       text: "Deslice para registrar",
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
