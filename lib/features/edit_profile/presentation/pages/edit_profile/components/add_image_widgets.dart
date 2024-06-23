// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageWidget extends StatelessWidget {
  XFile? imageFile;
  final String? title;
  AddImageWidget({Key? key, this.imageFile, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 140,
              width: 160,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: imageFile != null
                  ? Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.grey[600],
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title!,
            style: AppTextStyle.medium,
          ),
        ],
      ),
    );
  }
}
