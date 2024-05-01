import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/consts/app_colors.dart';
import 'image_picker_dialog.dart';

class DocumentManagementScreen extends StatelessWidget {
  const DocumentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenSize = Screen.fromContext(context).screenSize;

    double screenMargin = 0.0;
    switch (screenSize) {
      case ScreenSize.xsmall:
        screenMargin = 0.0;
        break;
      case ScreenSize.small:
        screenMargin = 0.1;
        break;
      case ScreenSize.medium:
        screenMargin = 0.2;
      case ScreenSize.large:
        screenMargin = 0.3;
      case ScreenSize.xlarge:
        screenMargin = 0.3;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * screenMargin,
          ),
          child: Column(
            children: [
              Gap(MediaQuery.of(context).viewPadding.top + 8),
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'مدیریت اسناد',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                ],
              ),
              ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 84),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      color: Colors.white,
                      boxShadow: AppColor.shadow2,
                    ),
                    child: const Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('محمد جواد بحیرایی'),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                Gap(5),
                                Text(
                                  'کامل (5/5)',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(5),
                        Divider(
                          color: Colors.black38,
                        ),
                        Gap(5),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('کارت ملی'),
                              ],
                            ),
                            Gap(16),
                            Row(
                              children: [
                                UploadImagePicker(title: 'روی کارت'),
                                Gap(12),
                                UploadImagePicker(title: 'پشت کارت'),
                              ],
                            ),
                          ],
                        ),
                        Gap(24),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('شناسنامه'),
                              ],
                            ),
                            Gap(16),
                            Row(
                              children: [
                                UploadImagePicker(title: 'صفحه اول'),
                                Gap(12),
                                UploadImagePicker(title: 'صفحه دوم'),
                                Gap(12),
                                UploadImagePicker(title: 'صفحه سوم'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      color: Colors.white,
                      boxShadow: AppColor.shadow2,
                    ),
                    child: const Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('همسر'),
                            Row(
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.orange,
                                  size: 22,
                                ),
                                Gap(5),
                                Text(
                                  'ناقص (0/5)',
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(5),
                        Divider(
                          color: Colors.black38,
                        ),
                        Gap(5),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('کارت ملی'),
                              ],
                            ),
                            Gap(16),
                            Row(
                              children: [
                                UploadImagePicker(title: 'روی کارت'),
                                Gap(12),
                                UploadImagePicker(title: 'پشت کارت'),
                              ],
                            ),
                          ],
                        ),
                        Gap(24),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('شناسنامه'),
                              ],
                            ),
                            Gap(16),
                            Row(
                              children: [
                                UploadImagePicker(title: 'صفحه اول'),
                                Gap(12),
                                UploadImagePicker(title: 'صفحه دوم'),
                                Gap(12),
                                UploadImagePicker(title: 'صفحه سوم'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadImagePicker extends StatefulWidget {
  final String title;
  const UploadImagePicker({
    super.key,
    required this.title,
  });

  @override
  State<UploadImagePicker> createState() => _UploadImagePickerState();
}

class _UploadImagePickerState extends State<UploadImagePicker> {
  final ImagePicker _picker = ImagePicker();

  List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool? isCheckedCamera = await showDialog(
          context: context,
          builder: (context) {
            return ImagePickerTypeDialog(
              file: files.isNotEmpty ? files.first : null,
            );
          },
        );

        if (isCheckedCamera == null) {
          return;
        }

        if (isCheckedCamera) {
          final image = await _picker.pickImage(
            source: isCheckedCamera ? ImageSource.camera : ImageSource.gallery,
            imageQuality: 70,
            preferredCameraDevice: CameraDevice.rear,
          );

          if (image != null && mounted) {
            CroppedFile? croppedFile = await ImageCropper().cropImage(
              sourcePath: image.path,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
              uiSettings: [
                AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  toolbarColor: Colors.deepOrange,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: false,
                ),
                IOSUiSettings(
                  title: 'Cropper',
                ),
                WebUiSettings(
                  context: context,
                ),
              ],
            );

            if (croppedFile != null) {
              files = [
                PlatformFile(
                  name: image.name,
                  bytes: await croppedFile.readAsBytes(),
                  path: croppedFile.path,
                  size: 0,
                ),
              ];
              setState(() {});
            }
          }
        } else {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            allowCompression: true,
            compressionQuality: 60,
            type: FileType.custom,
            allowedExtensions: [
              'png',
              'jpg',
              'jpeg',
            ],
          );

          if (result != null) {
            setState(() {
              files = [result.files.first];
            });
            // دستکاری و استفاده از فایل‌های انتخاب شده در اینجا
          }
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          if (files.isEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black45,
                size: 28,
              ),
            ),
          if (files.isNotEmpty)
            FutureBuilder(
              future: files.first.xFile.readAsBytes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.memory(
                    snapshot.data!,
                    width: 64,
                    height: 64,
                  );
                } else {
                  return const SizedBox(
                    width: 64,
                    height: 64,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          const Gap(8),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
