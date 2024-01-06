import 'package:flokemon/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class BlastoiteScreen extends StatelessWidget {
  const BlastoiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.blueGray200,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 23.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: SizedBox(
                              height: 906.v,
                              width: double.maxFinite,
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                            height: 345.adaptSize,
                                            width: 345.adaptSize,
                                            margin: EdgeInsets.only(top: 151.v),
                                            decoration: BoxDecoration(
                                                color: appTheme.lightBlue100,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        172.h),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: appTheme.gray90001,
                                                      spreadRadius: 2.h,
                                                      blurRadius: 2.h,
                                                      offset: Offset(0, 4))
                                                ]))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgStatBlastoise1,
                                        height: 343.adaptSize,
                                        width: 343.adaptSize,
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 34.h, top: 145.v)),
                                    Opacity(
                                        opacity: 0.8,
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGuaPng768x1024,
                                            height: 425.v,
                                            width: 289.h,
                                            alignment: Alignment.topCenter,
                                            margin:
                                                EdgeInsets.only(top: 101.v))),
                                    _buildAppBar(context),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 29.h),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      decoration: AppDecoration
                                                          .outlineBlack,
                                                      child: Text("#001",
                                                          style: theme.textTheme
                                                              .displayMedium)),
                                                  Container(
                                                      decoration: AppDecoration
                                                          .outlineBlack,
                                                      child: Text(
                                                          "BLAST\n\$99.99",
                                                          style: CustomTextStyles
                                                              .displayMediumIndigo900))
                                                ]))),
//tombol balik
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Fungsi untuk kembali ke layar sebelumnya
                                      },
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgContrast,
                                        height: 59.v,
                                        width: 57.h,
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(
                                            top: 5.v, right: 30.h),
                                      ),
                                    )
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 272.h,
                  margin: EdgeInsets.only(left: 71.h),
                  child: Text(
                      "A brutal Flokémon with pressurized water jets on its shell. They are used for high speed tackles. Once it takes aim at its enemy, it blasts out water with even more force than a fire hose. It It deliberately makes itself heavy so it can withstand the recoil of the water jets it fires.",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeRegular)),
              SizedBox(height: 25.v),
              SizedBox(
                  height: 99.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topRight, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle27,
                        height: 64.v,
                        width: 428.h,
                        alignment: Alignment.bottomCenter),
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse11,
                        height: 82.v,
                        width: 146.h,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(right: 42.h)),
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse11,
                        height: 82.v,
                        width: 146.h,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 42.h)),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: 268.h,
                            margin: EdgeInsets.fromLTRB(80.h, 18.v, 80.h, 22.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.h, vertical: 5.v),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: fs.Svg(ImageConstant.imgGroup46),
                                    fit: BoxFit.cover)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgBook9938131,
                                      height: 39.v,
                                      width: 34.h,
                                      margin: EdgeInsets.only(
                                          left: 3.h, top: 5.v, bottom: 5.v),
                                      onTap: () {
                                        onTapImgBook(context);
                                      }),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgCart8914073,
                                      height: 44.adaptSize,
                                      width: 44.adaptSize,
                                      margin: EdgeInsets.only(bottom: 5.v),
                                      onTap: () {
                                        onTapImgCart(context);
                                      })
                                ])))
                  ]))
            ]));
  }

  /// Navigates to the blastoiteStatScreen when the action is triggered.
  onTapImgBook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.blastoiteStatScreen);
  }

  /// Navigates to the withlistScreen when the action is triggered.
  onTapImgCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.withlistScreen);
  }
}
