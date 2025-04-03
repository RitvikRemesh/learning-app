import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider extends ChangeNotifier {
  String gmail;
  List<String> _items = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserProvider({this.gmail = ""}) {
    if (gmail.isNotEmpty) {
      fetchClasses(); // Fetch stored classes on login
    }
  }

  List<String> get items => _items;

  /// Fetch user classes from Firestore
  Future<void> fetchClasses() async {
    try {
      if (gmail.isEmpty) return; // Ensure user is logged in
      var doc = await _firestore.collection("users").doc(gmail).get();
      if (doc.exists && doc.data() != null) {
        _items = List<String>.from(doc.data()?["classes"] ?? []);
        notifyListeners();
      }
    } catch (e) {
      print(" Error fetching classes: $e");
    }
  }

  /// Add a class to Firestore and update UI
  Future<void> addItem(String newItem) async {
    try {
      if (!_items.contains(newItem)) {
        _items.add(newItem);
        await _firestore.collection("users").doc(gmail).set(
          {"classes": _items},
          SetOptions(merge: true), // Ensures data is merged
        );
        print(" Class '$newItem' added successfully");
        notifyListeners();
      }
    } catch (e) {
      print(" Error saving class: $e");
    }
  }

  /// Change username and fetch classes after login
  void changeUsername({required String newUsername}) {
    gmail = newUsername;
    fetchClasses();
    notifyListeners();
  }
}
