abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData({
    String documentsId,
    required String path,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({String documentId, required String path});
}
