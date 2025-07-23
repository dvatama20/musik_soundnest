import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MusicListPage extends StatefulWidget {
  const MusicListPage({super.key});

  @override
  State<MusicListPage> createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> songs = [];
  bool isLoading = true;

  Future<void> fetchSongs() async {
    final response = await supabase.from('songs').select();

    setState(() {
      songs = List<Map<String, dynamic>>.from(response);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Lagu')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : songs.isEmpty
          ? const Center(child: Text('Tidak ada lagu.'))
          : ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(song['title'] ?? ''),
            subtitle: Text(song['artist'] ?? ''),
            onTap: () {
              // Tambahkan aksi pemutaran lagu nanti
            },
          );
        },
      ),
    );
  }
}
