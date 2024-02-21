import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firebase_instance.dart';

class FirebaseConverter {
  static DocumentReference<Map<String, dynamic>> getDocRef({
    required String collectionName,
    required String id,
  }) =>
      firebaseFirestore.collection(collectionName).doc(id);

  static Future<Map<String, dynamic>> getDocMap({
    required DocumentReference<Map<String, dynamic>> docRef,
  }) async =>
      await docRef.get().then((_doc) => _doc.data() as Map<String, dynamic>);
}
