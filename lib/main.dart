import 'package:flutter/material.dart';
import 'package:proyecto_de_navegacion/Common/my_routers.dart';
import 'package:proyecto_de_navegacion/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion entre paginas',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouters.generateRoute,
      initialRoute: routeLogin,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 34, 53, 100),
      body: Column(
        children: [
          Image.asset(
            "images/fondo_2.jpg",
          ),
          const SizedBox(
            height: 21,
          ),
          const Text(
            "Bienvenidos",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 10),
            child: Text(
              "Una de las mejores aplicaciones para escuchar musica en cualquier lugar, ten la oportunidad de gozar de buena calidad de audio y usabilidad de la aplicacion",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Creadores: Adrian Castillo y Janier Acosta",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(88, 255, 255, 255),
            ),
          )
        ],
      ),

      //barra de navegacion
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 221, 209, 100),
        type: BottomNavigationBarType.fixed,
        //fixedColor: Color.fromARGB(255, 252, 252, 252),
        selectedItemColor: Colors.white, // Color para el ítem seleccionado
        unselectedItemColor:
            Colors.white, // Color para los ítems no seleccionados
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music_outlined),
            label: 'Music',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          // Aquí puedes agregar lógica específica para cada ítem del BottomNavigationBar.
          // El índice (index) te dice qué ítem fue seleccionado (0, 1, 2, 3, etc.).
          // Puedes realizar acciones diferentes para cada ítem.
          if (index == 0) {
            Navigator.pushNamed(context, routePlayList);
          } else if (index == 1) {
            Navigator.pushNamed(context, routeLogin);
          }
        },
      ),
    );
  }
}



