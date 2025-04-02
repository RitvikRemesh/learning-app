import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? _profileImageUrl; // To store the URL of the profile image from Firestore

  // Pick and upload the image to Firebase Storage, then store the URL in Firestore
  Future<void> pickUploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (image != null) {
      // Upload image to Firebase Storage
      File imageFile = File(image.path);
      try {
        // Reference to Firebase Storage location
        Reference ref = FirebaseStorage.instance.ref().child('profile_images/${FirebaseAuth.instance.currentUser!.uid}.jpg');
        
        // Upload the image to Firebase Storage
        await ref.putFile(imageFile);

        // Get the download URL of the uploaded image
        String downloadUrl = await ref.getDownloadURL();

        // Save the image URL to Firestore
        FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
          'profile_image_url': downloadUrl,
        });

        // Update the UI to show the uploaded image
        setState(() {
          _profileImageUrl = downloadUrl; // Update the profile image URL
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY ACCOUNT',
          style: TextStyle(color: Color.fromARGB(255, 92, 42, 179)),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 92, 42, 179)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 92, 42, 179),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Profile image circle
                GestureDetector(
                  onTap: pickUploadImage, // Trigger image picker on tap
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: _profileImageUrl != null
                        ? NetworkImage(_profileImageUrl!) // Use uploaded image URL
                        : null, // If there's no uploaded image, show nothing
                    child: _profileImageUrl == null
                        ? Icon(Icons.person, size: 40) // Default icon if no image is uploaded
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                // User email display
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser!.email!.replaceAll("@gmail.com", ""),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Other account settings
          Expanded(
            child: ListView(
              children: [
                _buildListTile('Account Setting', Icons.settings),
                _buildListTile('Document Upload', Icons.upload_file),
                _buildListTile('Notification Setting', Icons.notifications),
                _buildListTile('Privacy & Policy', Icons.privacy_tip),
                _buildListTile('Help Center', Icons.help),
                _buildListTile('About Us', Icons.info),
                _buildListTile('Delete Account', Icons.delete, Colors.black),
              ],
            ),
          ),
          // Log out button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 92, 42, 179),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build list tiles
  ListTile _buildListTile(String title, IconData icon, [Color? color]) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle navigation or action
      },
    );
  }
}
