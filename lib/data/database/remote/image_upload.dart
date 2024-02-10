 import 'dart:async';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  static Future<void> uploadImage(String filePath) async {
    // استبدل هذه القيم بقيمك الخاصة
    const String apiUrl = 'https://your-laravel-api.com/api/upload-image';
    const String token = 'YOUR_ACCESS_TOKEN';

    // إنشاء طلب Dio
    final Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    // تحويل ملف الصورة إلى MultipartFile
    final Future<MultipartFile> imageFile = MultipartFile.fromFile(filePath);

    // إرسال طلب POST مع الصورة
    final FormData formData = FormData.fromMap({
      'image': imageFile,
    });

    try {
      final response = await dio.post(apiUrl, data: formData);
      if (response.statusCode == 200) {
        print('تم تحميل الصورة بنجاح');
      } else {
        print('حدث خطأ أثناء تحميل الصورة');
      }
    } on DioError catch (e) {
      print('خطأ: ${e.message}');
    }
  }
}

void main() async {
  // استبدل هذا الكود باختيارك للصورة
  final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    final String filePath = pickedImage.path;
    await UploadImage.uploadImage(filePath);
  }
}
