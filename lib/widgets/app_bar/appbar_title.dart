import 'package:flokemon/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  final String text; // Ubah menjadi final karena nilai text tidak diubah

  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap
            ?.call(); // Menggunakan ? operator agar aman jika onTap bernilai null
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
          width: 275.h,
          decoration: AppDecoration.outlineBlack,
          child: Text(
            text, // Menambahkan null safety operator
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.displayMediumRed900.copyWith(
              color: appTheme.red900,
            ),
          ),
        ),
      ),
    );
  }
}
