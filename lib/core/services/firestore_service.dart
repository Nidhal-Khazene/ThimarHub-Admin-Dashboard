import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_dashboard/core/services/database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    String? documentsId,
    required String path,
    Map<String, dynamic>? query,
  }) async {
    if (documentsId != null) {
      var data = await firestore.collection(path).doc(documentsId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var isDescending = query['descending'];
          data.orderBy(orderByField, descending: isDescending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  }) {
    var data = firestore.collection(path).doc(documentId).get();
    return data.then((doc) => doc.exists);
  }

  @override
  Stream streamData({
    required String path,
    Map<String, dynamic>? query,
  }) async* {
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var isDescending = query['descending'];
        data.orderBy(orderByField, descending: isDescending);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data.limit(limit);
      }
    }
    // var result = await data.get();
    // return result.docs.map((e) => e.data()).toList();
    await for (var snapshot in data.snapshots()) {
      var data = snapshot.docs.map((e) => e.data()).toList();
      yield data;
    }
  }
}
