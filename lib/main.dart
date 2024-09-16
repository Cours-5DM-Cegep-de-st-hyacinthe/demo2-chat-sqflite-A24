import 'package:chatflutter/database/database.dart';
import 'package:flutter/material.dart';

import 'vue/page_principale.dart';

void main() {
  runApp(const MainAppStateful());
}

class MainAppStateful extends StatefulWidget {
  const MainAppStateful({super.key});

  @override 
  State<MainAppStateful> createState() => _MainAppStatefulState();
}

class _MainAppStatefulState extends State<MainAppStateful> {
  late DatabaseHandler _db;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();

    _db = DatabaseHandler();

    if(_db.database == null) {
      _isLoading = true;
      _initDatabase();
    } else {
      _isLoading = false;
    }
  }

  Future<void> _initDatabase() async {
    await _db.initDb();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Mon chat")),
        body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : const PagePrincipale()
      ),
    );
  }
}
