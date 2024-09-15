import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../core/consts/app_colors.dart';

class AddImgButton extends StatefulWidget {
  const AddImgButton({super.key});

  @override
  State<AddImgButton> createState() => _AddImgButtonState();
}

class _AddImgButtonState extends State<AddImgButton> {
  File? imgFile;

  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      imgFile = File(img.path);
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
      child: imgFile != null
          ? Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(imgFile!.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    onPressed: takeSnapshot,
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            )
          : ButtonWidget(onPressed: takeSnapshot),
    );
  }
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
