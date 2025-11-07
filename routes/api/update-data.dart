import 'package:dart_frog/dart_frog.dart';

/// PUT /api/update-data - Cập nhật dữ liệu
Future<Response> onRequest(RequestContext context) async {
  // Chỉ cho phép PUT method
  if (context.request.method != HttpMethod.put) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed. Use PUT method'},
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

    // Validate ID (bắt buộc phải có ID để cập nhật)
    if (!data.containsKey('id')) {
      return Response.json(
        statusCode: 400,
        body: {'error': 'ID is required for update'},
      );
    }

    // TODO: Cập nhật vào database
    // Hiện tại chỉ trả về dữ liệu đã cập nhật
    final updatedData = {
      ...data,
      'updatedAt': DateTime.now().toIso8601String(),
    };

    return Response.json(
      body: {
        'success': true,
        'message': 'Dữ liệu đã được cập nhật thành công!',
        'data': updatedData,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Invalid JSON format: ${e.toString()}'},
    );
  }
}
