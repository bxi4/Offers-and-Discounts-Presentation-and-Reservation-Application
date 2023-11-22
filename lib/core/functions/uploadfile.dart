import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orop/core/constant/color.dart';
//import 'package:permission_handler/permission_handler.dart';

imageUploadCamrea() async {
  try {
    final PickedFile? file = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 90);
    if (file != null) {
      return File(file.path);
    } else {
      return null;
    }
  } on PlatformException catch (e) {
    print("حدث خطأ في الوصول إلى الكاميرا: ${e.message}");
    return null;
  }
}

fileUploadCallery([isSvg = false]) async {
  //bool isPermissionGranted = await _requestPermission();
  try {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
  } on PlatformException catch (e) {
    // يتم عرض إشعار يخبر المستخدم بأن حدث خطأ في الوصول إلى الذاكرة الخارجية
    print("حدث خطأ في الوصول إلى الذاكرة الخارجية: ${e.message}");
    return null;
  }
}

showbottommenu(imageUploadCamrea(), fileUploadCallery()) {
  Get.bottomSheet(
      Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Text(
                    "اختيار الصورة",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ListTile(
                  onTap: () {
                    imageUploadCamrea();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                  title: const Text(
                    "صورة من الكاميرا",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  onTap: () {
                    fileUploadCallery();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.image,
                    size: 40,
                  ),
                  title: const Text(
                    "صورة من الاستوديو",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: Colors.white);
}
