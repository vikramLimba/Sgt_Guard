import 'dart:io';

import 'package:form_login/styles/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FrontImageController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  RxBool btnEnabled = false.obs;

  XFile? pickedFile;
  void getImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(
      source: imageSource,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile!.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
    } else {
      Get.snackbar("Error", 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.white);
    }
  }
  
  // if(pickedFile != null){

  // }
}
