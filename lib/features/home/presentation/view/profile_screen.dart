import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:porduct_owner/core/core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _picker = ImagePicker();
  XFile? profileImagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
            child: SizedBox(
              width: double.infinity,
              height:
                  size.height - MediaQuery.of(context).viewPadding.top - 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.indigo,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: profileImagePath?.path != null
                                  ? SizedBox(
                                      width: 96,
                                      height: 96,
                                      child: Image.file(
                                        File(profileImagePath!.path),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 96,
                                      height: 96,
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                            Positioned(
                              right: 24,
                              left: 24,
                              bottom: -15,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                ),
                                color: Colors.white.withOpacity(0.6),
                                iconSize: 18,
                                onPressed: () async {
                                  // Pick an image
                                  final temp = await _picker.pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 100,
                                  );

                                  if (mounted && temp != null) {
                                    setState(() {
                                      profileImagePath = temp;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(14),
                  const Text(
                    'میلاد محمدی',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(44),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'شرکت:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'صنایع غذایی کوروش',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سمت:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'نماینده',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تلفن تماس:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '09039060355',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'کد ملی:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '0022433449',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'جنسیت:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'مرد',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تاریخ تولد:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '1378/06/15',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(14),
                      ],
                    ),
                  ),
                  const Gap(44),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'خروج از حساب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
