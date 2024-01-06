import 'package:flokemon/core/app_export.dart';
import 'package:flokemon/core/utils/image_constant.dart';
import 'package:flokemon/core/utils/size_utils.dart';
import 'package:flokemon/routes/app_routes.dart';
import 'package:flokemon/theme/app_decoration.dart';
import 'package:flokemon/theme/custom_text_style.dart';
import 'package:flokemon/theme/theme_helper.dart';
import 'package:flokemon/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class KuramonScreen extends StatelessWidget {
  const KuramonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.deepOrange700.withOpacity(0.98),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 27.v),
                  SizedBox(
                      height: 779.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text("#004",
                                    style: theme.textTheme.displayMedium))),
                        Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 769.v,
                                width: double.maxFinite,
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(
                                              context); // Kembali ke layar sebelumnya saat gambar ditekan
                                        },
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgContrast,
                                          height: 59.v,
                                          width: 57.h,
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(right: 31.h),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SizedBox(
                                              height: 730.v,
                                              width: double.maxFinite,
                                              child: Stack(
                                                  alignment: Alignment.topLeft,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                            height:
                                                                345.adaptSize,
                                                            width:
                                                                345.adaptSize,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 31.h,
                                                                    top: 105.v),
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .lightBlue100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            172.h),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: appTheme
                                                                          .gray90001,
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              4))
                                                                ]))),
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                            width: 245.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 24.h),
                                                            decoration:
                                                                AppDecoration
                                                                    .outlineBlack,
                                                            child: Text(
                                                                "KURAMON\n\$999.99",
                                                                maxLines: null,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: CustomTextStyles
                                                                    .displayMediumRedA70001))),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgKuramon,
                                                        height: 318.v,
                                                        width: 361.h,
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 23.h,
                                                            top: 122.v)),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Container(
                                                            width: 286.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 61.h),
                                                            child: Text(
                                                                "Kuramon more commonly known as the Nine-Tails (Kyūbi), was one of the nine evil pokemons. Centuries of being regarded as a mindless monster and sought after as a tool for war caused Kuramon to hate humans",
                                                                maxLines: 9,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: CustomTextStyles
                                                                    .titleLargeRegular22))),
//rasengan tytyd
                                                    Opacity(
                                                      opacity: 0.5,
                                                      child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage8,
                                                          height: 457.v,
                                                          width: 428.h,
                                                          alignment: Alignment
                                                              .topCenter,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 52.v)),
                                                    )
                                                  ])))
                                    ])))
                      ])),
                  SizedBox(height: 20.v),
                  _buildAppBar(context)
                ]))));
  }

  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
        height: 99.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 64.v,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: appTheme.redA70001,
                      borderRadius: BorderRadius.circular(20.h)))),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse11DeepOrange700,
              height: 82.v,
              width: 137.h,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 51.h)),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse11DeepOrange700,
              height: 82.v,
              width: 137.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 51.h)),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse11DeepOrange700,
              height: 82.v,
              width: 137.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 51.h)),
          CustomImageView(
              imagePath: ImageConstant.imgCart8914073,
              height: 41.adaptSize,
              width: 41.adaptSize,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 26.v, right: 101.h),
              onTap: () {
                onTapImgCart(context);
              }),
          CustomImageView(
              imagePath: ImageConstant.imgBook9938131,
              height: 39.v,
              width: 34.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 101.h, top: 28.v),
              onTap: () {
                onTapImgBook(context);
              })
        ]));
  }

  /// Navigates to the withlistScreen when the action is triggered.
  onTapImgCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.withlistScreen);
  }

  /// Navigates to the kuramonStatScreen when the action is triggered.
  onTapImgBook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kuramonStatScreen);
  }
}
