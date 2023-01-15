import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:geolocator/geolocator.dart';

class Request extends DioForNative {
  Request([BaseOptions? baseOptions]) : super(baseOptions) {
    options
      ..baseUrl = 'https://www.'
      ..connectTimeout = 5000 //5s
      ..receiveTimeout = 5000
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {
        HttpHeaders.userAgentHeader: 'dio',
        'common-header': 'xx',
      };

    interceptors
      ..add(InterceptorsWrapper(
          onRequest: (options, handler) async {
            var permission = await Geolocator.checkPermission();

            if (permission == LocationPermission.denied) {
              permission = await Geolocator.requestPermission();
            }
            return handler.next(options);
          },
          onError: (options, handler) async {}))
      ..add(LogInterceptor(responseBody: false));
  }
}

// void main() async {
//   var dio = Dio();
//   dio.options
//     ..baseUrl = 'https://www.google.com/'
//     ..connectTimeout = 5000 //5s
//     ..receiveTimeout = 5000
//     ..validateStatus = (int? status) {
//       return status != null && status > 0;
//     }
//     ..headers = {
//       HttpHeaders.userAgentHeader: 'dio',
//       'common-header': 'xx',
//     };

//   dio.interceptors
//     ..add(InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           var permission = await Geolocator.checkPermission();

//           if (permission == LocationPermission.denied) {
//             permission = await Geolocator.requestPermission();
//           }
//           return handler.next(options);
//         },
//         onError: (options, handler) async {}))
//     ..add(LogInterceptor(responseBody: false)); //Open log;

//   var response = await dio.get('https://www.google.com/');

//   // Download a file
//   response = await dio.download(
//     'https://www.google.com/',
//     './example/xx.html',
//     queryParameters: {'a': 1},
//     onReceiveProgress: (received, total) {
//       if (total != -1) {
//         print('$received,$total');
//       }
//     },
//   );

//   // Create a FormData
//   var formData = FormData.fromMap({
//     'age': 25,
//     'file': await MultipartFile.fromFile(
//       './example/upload.txt',
//       filename: 'upload.txt',
//     )
//   });

//   // Send FormData
//   response = await dio.post('/test', data: formData);
//   print(response);

//   // post data with "application/x-www-form-urlencoded" format
//   response = await dio.post(
//     '/test',
//     data: {
//       'id': 8,
//       'info': {
//         'name': 'wendux',
//         'age': 25,
//       }
//     },
//     options: Options(
//       contentType: Headers.formUrlEncodedContentType,
//     ),
//   );
//   print(response.data);
// }
