import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_uploading_file/services/service.dart';

class UploadFile {
  HttpService httpService = HttpService();

  Future uploadFile(File file) async {
    httpService.init();

    MultipartFile multipartFile = await MultipartFile.fromFile(file.path,
        filename: file.path.split("/").last);
    Map<String, dynamic> map = {"file": multipartFile};

    FormData formData = FormData.fromMap(map);

    Response result = await httpService.request(
        url: "uploadFile", method: Method.POST, data: formData);

    return result;
  }
}
