import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';
import '../../../../core/consts/app_colors.dart';
import '../../../auth/presentation/widgets/app_large_title.dart';
import '../pages/add_new_task_screen.dart';

class AddImgButton extends StatefulWidget {
  const AddImgButton({super.key});

  @override
  State<AddImgButton> createState() => _AddImgButtonState();
}

class _AddImgButtonState extends State<AddImgButton> {
  // File? imgFile;
  ImageSource imageSource = ImageSource.gallery;
  void selectImageSource() {
    showDialog(
        context: context,
        builder: (BuildContext context) => selectDialog(context));
  }

  void takeSnapshot(ImageSource imgSrc) async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: imgSrc,
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      todoImg = img.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(kBorderRadius),
      dashPattern: const [4, 4],
      color: AppColors.primary,
      strokeWidth: 2,
      child: todoImg != null
          ? Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(todoImg!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    onPressed: selectImageSource,
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            )
          : ButtonWidget(onPressed: selectImageSource),
    );
  }

  Dialog selectDialog(context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(kBorderRadius)), //this right here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLargeTitle(title: "Select Image Source"),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                // height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      title: "Gallery",
                      onPressed: () {
                        takeSnapshot(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      iconData: Icons.image_outlined,
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      title: "Camera",
                      onPressed: () {
                        takeSnapshot(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      iconData: Icons.camera_alt_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 36,
          ),
          SizedBox(width: 8),
          Text('Add Img',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
