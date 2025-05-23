import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiConstance {
  // base link
  static const String _httpServerLink = "https://mdev.yemensoft.net:473";

  static String getImageLink({required String imageUri}) =>
      "$_httpServerLink$imageUri";

  // ################ START LOGIN ENDPOINTS LINK ################
  static const String loginLink = "$_httpServerLink/OnyxDeliveryService/Service.svc/CheckDeliveryLogin";
  static const String getOrdersLink = "$_httpServerLink/OnyxDeliveryService/Service.svc/GetDeliveryBillsItems";



  // static String httpLinkGetAllCourses(
  //         {required int pageNumber,
  //         required int pageSize,
  //         required String keywordSearch}) =>
  //     '$_httpServerLinkWithCourses/GetAllCoursesAsync?PageNumber=$pageNumber&PageSize=$pageSize${keywordSearch.trim().isEmpty ? '' : '&Search=$keywordSearch'}';

  // static String httpLinkCreateCourse =
  //     '$_httpServerLinkWithCourses/CreateCourseAsync';

  // static String httpLinkUpdateCourse =
  //     '$_httpServerLinkWithCourses/UpdateCourseAsync';

  // static String httpLinkDeleteCourse({required int courseId}) =>
  //     '$_httpServerLinkWithCourses/RemoveCourseAsync/$courseId';

  // ################ END COURSES ENDPOINTS LINK ################

  // ################ START UNITS ENDPOINTS LINK ################
  // static String httpLinkCreateUnit =
  //     '$_httpServerLinkWithUnits/CreateUnitAsync';
  // static String httpLinkUpdateUnit =
  //     '$_httpServerLinkWithUnits/UpdateUnitAsync';
  //
  // static String httpLinkDeleteUnit({required int unitId}) =>
  //     '$_httpServerLinkWithUnits/RemoveUnitAsync?unitId=$unitId';

  // ################ END UNITS ENDPOINTS LINK ################

  // ################ START LESSONS ENDPOINTS LINK ################
  // static String httpLinkCreateLesson =
  //     '$_httpServerLinkWithLessons/CreateLessonAsync';
  // static String httpLinkUpdateLesson =
  //     '$_httpServerLinkWithLessons/UpdateLessonAsync';
  //
  // static String httpLinkDeleteLesson({required int lessonId}) =>
  //     '$_httpServerLinkWithLessons/RemoveLessonAsync?id=$lessonId';

  // ################ END LESSONS ENDPOINTS LINK ################


  static Future<http.Response> getData(
      {required String url, required String accessToken}) async {
    var response = await http.get(
      Uri.parse(url),
      // headers: <String, String>{'Authorization': 'Bearer $accessToken'},
    );
    return response;
  }

  static Future<http.Response> postData(
      {required String url,
      // required String accessToken,
      required Map<String, dynamic> data}) async {
    return await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: <String, String>{
        // 'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    );
  }

  static Future<http.Response> putData(
      {required String url,
      // required String accessToken,
      required Map<String, dynamic> data}) async {
    return await http.put(
      Uri.parse(url),
      body: json.encode(data),
      headers: <String, String>{
        // 'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    );
  }

  static Future<http.Response> deleteData({
    required String url,
    required String accessToken,
  }) async {
    return await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    );
  }

  static Future<http.Response> login(
      {required String url,
      required String email,
      required String password}) async {
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$email:$password'))}';
    return await http.get(
      Uri.parse(url),
      headers: <String, String>{'authorization': basicAuth},
    );
  }

  static Future<http.Response> getRequest({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    return response;
  }

  // static Future<http.Response> postRequestWithFile({required String url, required Map data, required File file, required String accessToken}) async {
  //   var request = http.MultipartRequest("POST",
  //       Uri.parse(url),
  //   );
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multipartFile = http.MultipartFile(
  //     "imageFile", stream, length,
  //       filename: basename(file.path),
  //   );
  //   request.files.add(multipartFile);
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   var myRequest = await request.send();
  //
  //   var response = await http.Response.fromStream(myRequest);
  //
  //   return response;
  // }

  static Future<http.Response> putRequestWithFile(
      {required String url,
      required Map data,
      required File file,
      required String accessToken}) async {
    var request = http.MultipartRequest("PUT", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("imageFile", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);

    return response;
  }

  static Future<http.Response> postAndPutForm({
    required String url,
    required Uint8List? fileBytes,
    required String accessToken,
    required String fileFieldName,
    required Map<String, dynamic> data,
    required bool isPost,
  }) async {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest(isPost ? 'POST' : 'PUT', uri);

    // التحقق من ملف الصورة وإضافته
    if (fileBytes != null) {
      if (fileBytes.isNotEmpty) {
        request.files.add(http.MultipartFile.fromBytes(
          fileFieldName,
          fileBytes,
          filename: 'xsaupload.jpg',
        ));
      } else {
        throw Exception('Image file is null or empty');
      }
    }

    // إضافة الحقول الإضافية بعد التحقق
    data.forEach((key, value) {
      if (value != null) {
        request.fields[key] = value.toString();
      } else {
        throw Exception('Field $key is null');
      }
    });

    // التحقق من رمز الوصول وإضافته
    if (accessToken.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $accessToken';
    }

    request.headers['Content-Type'] = 'application/form';

    // إرسال الطلب
    var response = await http.Response.fromStream(await request.send());

    return response;
  }
}
