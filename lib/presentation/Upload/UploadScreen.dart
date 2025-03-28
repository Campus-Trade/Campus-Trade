import 'dart:io';
import 'package:campus_trade/presentation/Cubit/UploadCubit_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../Cubit/UploadCubit_State.dart';
import '../SellScreen/Sellscreen.dart';
import '../resources/color_manager.dart';
import '../resources/text_styles.dart';
import 'widgets/AppBar_Upload.dart';
import 'widgets/CustomSelectButton.dart';
import 'widgets/SelectFile.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        print("Image selected: ${image.path}");
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpload(isvisible: true),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state is UploadFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errormessage}')),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 20, right: 20, bottom: 8, left: 20),
                child: Center(
                  child: Text(
                    "Upload a photo of your product",
                    style: TextStyles.black22Bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, right: 20, left: 20, bottom: 43),
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
                padding: EdgeInsets.only(right: 20, left: 20, top: 60),
                child: Row(
                  children: [
                    Container(
                        width: 177, height: 1, color: ColorManager.greyColor),
                    Text("OR", style: TextStyles.grey12Regular),
                    Container(
                        width: 177, height: 1, color: ColorManager.greyColor),
                  ],
                ),
              ),
              Customselectbutton(
                UploadImage: () => pickImage(ImageSource.camera),
                icon: Icons.photo_camera,
                text: "Open Camera",
                top: 40,
              ),
              if (state is UploadLoading)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              Customselectbutton(
                text: "Continue",
                top: 130,
                UploadImage: () {
                  if (_image != null) {
                    context.read<UploadCubit>().uploadImage(context, _image);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SellScreen();
                    }));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please select an image first!")),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
