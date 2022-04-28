import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test_flutter/models/user.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final usersRef = FirebaseFirestore.instance.collection("users");

  Future createUser(String name, int age) async {
    final docRef = usersRef.doc();

    final user = User(
      id: docRef.id,
      name: name, 
      age: age
    );

    await docRef.set(user.toJson())
      .then((value) => print('Success'))
      .catchError((e) => print('Error: $e'));
  }

  Stream<List<User>> readUsers() => usersRef.snapshots()
    .map((snapshot) => 
      snapshot.docs.map((doc) => 
        User.fromJson(doc.data())
      ).toList()
    );
}