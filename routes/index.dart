import 'package:dart_frog/dart_frog.dart';

/// Root endpoint - Trang chủ API
Response onRequest(RequestContext context) {
  return Response.json(
    body: {
      'message': 'Welcome to Dart Frog API Server! 🐸',
      'version': '1.0.0',
      'endpoints': {
        'GET /api/get-data': 'Lấy dữ liệu',
        'POST /api/add-data': 'Thêm dữ liệu mới',
        'PUT /api/update-data': 'Cập nhật dữ liệu',
        'DELETE /api/delete-data': 'Xóa dữ liệu',
      },
    },
  );
}
