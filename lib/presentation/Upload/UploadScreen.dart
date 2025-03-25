import 'dart:io';
import 'package:campus_trade/presentation/Upload/widgets/AppBar_Upload.dart';
import 'package:campus_trade/presentation/Upload/widgets/CustomSelectButton.dart';
import 'package:campus_trade/presentation/Upload/widgets/SelectFile.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:campus_trade/presentation/sign_up/upload_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Uploadscreen extends StatefulWidget {
  const Uploadscreen({super.key});

  @override
  State<Uploadscreen> createState() => _UploadscreenState();
}

class _UploadscreenState extends State<Uploadscreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        print("📸 Image selected: ${image.path}");
      } else {
        print("❌ No image selected");
      }
    } catch (e) {
      print("⚠️ Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpload(isvisible: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 20.r, right: 20.r, bottom: 8.r, left: 20.r),
            child: Center(
              child: Text(
                "Upload a photo of your product",
                style: TextStyles.black22Bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 8.r, right: 20.r, left: 20.r, bottom: 43.r),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "Please upload a clear, well-lit photo of your product. Use a clean background.",
                style: TextStyles.black14Regular,
              ),
            ),
          ),
          Selectfile(
            image: _image,
            UploadImage: () => pickImage(ImageSource.gallery),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.r, left: 20.r, top: 60.r),
            child: Row(
              children: [
                Container(width: 177, height: 1, color: ColorManager.greyColor),
                Text("OR", style: TextStyles.grey12Regular),
                Container(width: 177, height: 1, color: ColorManager.greyColor),
              ],
            ),
          ),
          Customselectbutton(
            UploadImage: () => pickImage(ImageSource.camera),
            icon: Icons.photo_camera,
            text: "Open Camera",
            top: 40,
          ),
          Customselectbutton(text: "Continue", top: 130),
        ],
      ),
    );
  }
}

// void uploadImage() {
//   final storageRef = FirebaseStorage.instance.ref();
// }
