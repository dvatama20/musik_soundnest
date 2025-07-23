import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, String>> songs = List.generate(
    10,
        (index) => {
      'title': 'Judul Lagu $index',
      'artist': 'Artis $index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Music')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search music",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (_, index) {
                final song = songs[index];
                return ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(song['title']!),
                  subtitle: Text(song['artist']!),
                  trailing: Icon(Icons.play_arrow),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
