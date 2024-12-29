import 'package:get/get.dart';
// import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var name = "Ardi Febrian".obs;
  var photoPath = "assets/images/profile.png".obs;

  final ImagePicker _picker = ImagePicker();

  // Function to pick image
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photoPath.value = image.path; // Update photo path dynamically
    }
  }

  // Function to update name
  void updateName(String newName) {
    name.value = newName;
  }
}
