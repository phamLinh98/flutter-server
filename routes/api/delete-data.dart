import 'package:dart_frog/dart_frog.dart';

/// DELETE /api/delete-data - Xóa dữ liệu
Future<Response> onRequest(RequestContext context) async {
  // Chỉ cho phép DELETE method
  if (context.request.method != HttpMethod.delete) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed. Use DELETE method'},
    );
  }

  try {
    // Lấy query parameters hoặc body
    final uri = context.request.uri;
    final id = uri.queryParameters['id'];

    // Validate ID
    if (id == null || id.isEmpty) {
      return Response.json(
        statusCode: 400,
        body: {'error': 'ID is required. Use ?id=<id> in query parameter'},
      );
    }

    return Response.json(
      body: {
        'success': true,
        'message': 'Dữ liệu với ID $id đã được xóa thành công!',
        'deletedId': id,
        'deletedAt': DateTime.now().toIso8601String(),
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Error deleting data: ${e.toString()}'},
    );
  }
}
