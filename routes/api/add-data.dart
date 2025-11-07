import 'package:dart_frog/dart_frog.dart';

/// POST /api/add-data - Thêm dữ liệu mới
Future<Response> onRequest(RequestContext context) async {
  // Chỉ cho phép POST method
  if (context.request.method != HttpMethod.post) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed. Use POST method'},
    );
  }

  try {
    // Lấy dữ liệu từ request body
    final data = await context.request.json() as Map<String, dynamic>;

    // Validate dữ liệu
    if (data.isEmpty) {
      return Response.json(
        statusCode: 400,
        body: {'error': 'Request body cannot be empty'},
      );
    }

    final newData = {
      'id': DateTime.now().millisecondsSinceEpoch,
      ...data,
      'createdAt': DateTime.now().toIso8601String(),
    };

    return Response.json(
      statusCode: 201,
      body: {
        'success': true,
        'message': 'Dữ liệu đã được tạo thành công!',
        'data': newData,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Invalid JSON format: ${e.toString()}'},
    );
  }
}
