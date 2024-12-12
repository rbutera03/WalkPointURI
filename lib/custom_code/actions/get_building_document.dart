// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<BuildingsRecord?> getBuildingDocument(String buildingName) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Query Firestore collection to find the document with the given building name
  final querySnapshot = await FirebaseFirestore.instance
      .collection('buildings') // Replace with the correct collection name
      .where('name', isEqualTo: buildingName)
      .limit(1) // Limiting to one document
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    // Convert Firestore document to BuildingsRecord
    return BuildingsRecord.fromSnapshot(querySnapshot.docs.first);
  }
  return null; // Return null if no matching document is found

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
