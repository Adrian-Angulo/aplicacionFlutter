import 'package:flutter/material.dart';

import '../Common/my_routers.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  // lista de objetos Song que se pasan al widget como parámetro songs
  //En un proceso real esta informacion se debe consumir desde un api rest
  //que devuelva una respuesta en formato json
  final songs = [
    Song(
      title: 'Antes que se acabe',
      subtitle: 'Princso',
      albumArtUrl: 'images/nino.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Camara luces',
      subtitle: 'Arcangel',
      albumArtUrl: 'images/donOmar.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
    Song(
      title: 'Como si nada',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima3.jpg',
      mp3Path: 'assets/mp3/tema_3.mp3',
    ),
    Song(
      title: 'Artista 4',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima4.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Artista 5',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima5.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
    Song(
      title: 'Artista 6',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima6.jpg',
      mp3Path: 'assets/mp3/tema_3.mp3',
    ),
    Song(
      title: 'Artista 7',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima7.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Artista 8',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima8.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 74, 103, 0.612),
        title: Text("Lista de canciones"),
      ),
      body: SongListView(songs: songs),

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
            icon: Icon(Icons.house_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          // Aquí puedes agregar lógica específica para cada ítem del BottomNavigationBar.
          // El índice (index) te dice qué ítem fue seleccionado (0, 1, 2, 3, etc.).
          // Puedes realizar acciones diferentes para cada ítem.
          if (index == 0) {
            Navigator.pushNamed(context, routeHome);
          } else if (index == 1) {
            Navigator.pushNamed(context, routeLogin);
          }
        },
      ),
    );
  }
}

class Song {
  final String title;
  final String subtitle;
  final String albumArtUrl;
  final String mp3Path;

  Song({
    required this.title,
    required this.subtitle,
    required this.albumArtUrl,
    required this.mp3Path,
  });
}

//Widget personalizado SonListView
class SongListView extends StatelessWidget {
  final List<Song> songs;

  const SongListView({
    Key? key,
    required this.songs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];

        return Container(
          margin: EdgeInsets.only(top: 20, right: 20, left: 5),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 221, 209, 100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  showDialogWithSong(context, song);
                },
                child: ClipRRect(
                    child: Image.asset(
                  song.albumArtUrl,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                )),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    song.subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 25,
                    color: Color(0xFF31314F),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, routNowPlay, arguments: song);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void showDialogWithSong(BuildContext context, Song song) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información de la Canción'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Título: ${song.title}'),
              Text('Subtítulo: ${song.subtitle}'),
              Text('Mp3: ${song.mp3Path}'),
              Text('Album: ${song.albumArtUrl}'),
              // Puedes agregar más información según tus necesidades
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
