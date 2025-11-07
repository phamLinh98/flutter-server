import 'package:dart_frog/dart_frog.dart';

/// GET /api/get-data - Lấy dữ liệu
Response onRequest(RequestContext context) {
  // Chỉ cho phép GET method
  if (context.request.method != HttpMethod.get) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed. Use GET method'},
    );
  }

  return Response.json(
    body: {
      'success': true,
      'message': 'Dữ liệu đã được lấy thành công!',
      'data': [
        {
          'id': 1,
          'name': 'Item 1',
          'createdAt': DateTime.now().toIso8601String(),
        },
        {
          'id': 2,
          'name': 'Item 2',
          'createdAt': DateTime.now().toIso8601String(),
        },
        {
          'id': 3,
          'name': 'Item 3',
          'createdAt': DateTime.now().toIso8601String(),
        },
      ],
    },
  );
}
