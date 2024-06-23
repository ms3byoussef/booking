// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function()? onTap;
  const SearchBar({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.4))),
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: appTranslation(context).search,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: AppTextStyle.smallStyle.copyWith(color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search_rounded, color: Colors.grey),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
