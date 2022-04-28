import 'package:firebase_test_flutter/models/user.dart';
import 'package:firebase_test_flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final databaseService = DatabaseService();

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input screen"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text("Name")
            ),
          ),
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Age")
            ),
          ),
          ElevatedButton(
            onPressed: () => databaseService.createUser(
              nameController.text, 
              int.parse(ageController.text)
            ), 
            child: const Text("New User")
          )
        ],
      ),
    );
  }
}