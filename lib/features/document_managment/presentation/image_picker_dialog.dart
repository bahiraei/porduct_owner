import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:gap/gap.dart';

class ImagePickerTypeDialog extends StatefulWidget {
  final PlatformFile? file;
  const ImagePickerTypeDialog({
    super.key,
    required this.file,
  });

  @override
  State<ImagePickerTypeDialog> createState() => _ImagePickerTypeDialogState();
}

class _ImagePickerTypeDialogState extends State<ImagePickerTypeDialog> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenSize = Screen.fromContext(context).screenSize;

    double screenMargin = 0.0;
    switch (screenSize) {
      case ScreenSize.xsmall:
        screenMargin = 0.7;
        break;
      case ScreenSize.small:
        screenMargin = 0.45;
        break;
      case ScreenSize.medium:
        screenMargin = 0.35;
      case ScreenSize.large:
        screenMargin = 0.25;
      case ScreenSize.xlarge:
        screenMargin = 0.2;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * screenMargin,
        height: 180,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        height: 78,
                        width: 78,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 24,
                              color: Colors.black,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'دوربین',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Container(
                        height: 78,
                        width: 78,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 24,
                              color: Colors.black,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'گالری',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.file != null)
                  Column(
                    children: [
                      const Gap(16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: OutlinedButton(
                                onPressed: () async {
                                  /*await widget.file?.xFile
                                      .readAsBytes()
                                      .then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ShowImageFullScreen(
                                          isBase64: true,
                                          base64Image: value,
                                        ),
                                      ),
                                    );
                                  });*/
                                },
                                child: const Text(
                                  'پیش نمایش',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
