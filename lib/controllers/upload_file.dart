import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_uploading_file/constants/constants.dart';
import 'package:flutter_uploading_file/services/service.dart';

class UploadFile {
  HttpService httpService = HttpService();

  Future uploadFile(File file) async {
    httpService.init();
    logger.e("Data to be sent: ${file.path}");
    MultipartFile multipartFile = await MultipartFile.fromFile(file.path,
        filename: file.path.split("/").last);
    Map<String, dynamic> map = {"file": multipartFile};

    FormData formData = FormData.fromMap(map);

    final result = await httpService.request(
        url: "uploadFile", method: Method.POST, data: formData);
    logger.i("Received Result: $result ");
    return result;
  }
}
