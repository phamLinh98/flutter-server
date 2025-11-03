import 'package:dart_frog/dart_frog.dart';

/// ✅ Hàm xử lý GET request
Response _getHandler(RequestContext context) {
  return Response.json(
    body: {
      'method': 'GET',
      'message': 'Dữ liệu đã được lấy thành công!',
    },
  );
}

/// ✅ Hàm xử lý POST request
Future<Response> _postHandler(RequestContext context) async {
  final data = await context.request.json();
  return Response.json(
    body: {
      'method': 'POST',
      'message': 'Đã tạo mới dữ liệu!',
      'data': data,
    },
  );
}

/// ✅ Hàm xử lý PUT request (cập nhật)
Future<Response> _putHandler(RequestContext context) async {
  final data = await context.request.json();
  return Response.json(
    body: {
      'method': 'PUT',
      'message': 'Dữ liệu đã được cập nhật!',
      'updatedData': data,
    },
  );
}

/// ✅ Hàm xử lý DELETE request
Response _deleteHandler(RequestContext context) {
  return Response.json(
    body: {
      'method': 'DELETE',
      'message': 'Dữ liệu đã được xóa!',
    },
  );
}

/// ✅ Hàm chính của route: phân nhánh theo method
Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getHandler(context);
    case HttpMethod.post:
      return _postHandler(context);
    case HttpMethod.put:
      return _putHandler(context);
    case HttpMethod.delete:
      return _deleteHandler(context);
    // ignore: no_default_cases
    default:
      return Response(statusCode: 405, body: 'Method not allowed');
  }
}
