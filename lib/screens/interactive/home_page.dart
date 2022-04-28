import 'package:firebase_test_flutter/models/user.dart';
import 'package:firebase_test_flutter/screens/interactive/input.dart';
import 'package:firebase_test_flutter/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: StreamBuilder<List<User>>(
        stream: databaseService.readUsers(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text('Issue: ${snapshot.error}');
          } else if(snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(buildUserView).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const InputScreen())
        )
      ),
    );
  }

  Widget buildUserView(User user) => ListTile(
    leading: const CircleAvatar(child: Icon(Icons.account_circle)),
    title: Text(user.name),
    subtitle: Text(user.id),
  );
}