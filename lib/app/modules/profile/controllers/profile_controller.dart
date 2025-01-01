import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var name = "Ardi Febrian".obs;
  var email = "ardifebrian@gmail.com".obs;
  var phone = "081234567890".obs;
  var address = "Jl. Mawar No. 10, Payakumbuh".obs;
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

  // Function to update email
  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  // Function to update phone
  void updatePhone(String newPhone) {
    phone.value = newPhone;
  }

  // Function to update address
  void updateAddress(String newAddress) {
    address.value = newAddress;
  }
}
