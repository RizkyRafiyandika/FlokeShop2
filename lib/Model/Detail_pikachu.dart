import 'dart:convert';

import 'package:flokemon/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PikachuScreen extends StatefulWidget {
  String nama;
  PikachuScreen({Key? key, required this.nama}) : super(key: key);

  @override
  State<PikachuScreen> createState() => _PikachuScreenState();
}

class _PikachuScreenState extends State<PikachuScreen> {
  List<Map<String, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final res = await http
          .get(Uri.parse('http://192.168.0.108:3000/product1/${widget.nama}'));
      final jsonResponse = jsonDecode(res.body);
      if (mounted) {
        setState(() {
          productList = List<Map<String, dynamic>>.from(jsonResponse['data']);
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.yellow500F9,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 27.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: SizedBox(
                              height: 779.v,
                              width: double.maxFinite,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.h, right: 73.h),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("#003",
                                                      style: theme.textTheme
                                                          .displayMedium),
                                                  Spacer(),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                          width: 283.h,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 46.h),
                                                          child: Text(
                                                              "Raikiri was designed around the concept of electricity. They are creatures that have short, yellow fur with brown markings covering their backs and parts of their lightning bolt-shaped tails.",
                                                              maxLines: 8,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: CustomTextStyles
                                                                  .titleLargeRegular22)))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                            height: 514.v,
                                            width: double.maxFinite,
                                            margin: EdgeInsets.only(top: 9.v),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(
                                                          context); // Kembali ke layar sebelumnya saat gambar ditekan
                                                    },
                                                    child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgContrast,
                                                      height: 59.v,
                                                      width: 57.h,
                                                      alignment:
                                                          Alignment.topRight,
                                                      margin: EdgeInsets.only(
                                                          right: 31.h),
                                                    ),
                                                  ),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: SizedBox(
                                                          height: 472.v,
                                                          width:
                                                              double.maxFinite,
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    child: Container(
                                                                        height: 345.adaptSize,
                                                                        width: 345.adaptSize,
                                                                        margin: EdgeInsets.only(left: 31.h),
                                                                        decoration: BoxDecoration(color: appTheme.lightBlue100, borderRadius: BorderRadius.circular(172.h), boxShadow: [
                                                                          BoxShadow(
                                                                              color: appTheme.gray90001,
                                                                              spreadRadius: 2.h,
                                                                              blurRadius: 2.h,
                                                                              offset: Offset(0, 4))
                                                                        ]))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Container(
                                                                        width: 245.h,
                                                                        margin: EdgeInsets.only(left: 25.h),
                                                                        decoration: AppDecoration.outlineBlack,
                                                                        child: Text("Raikiri\n\$999.99",
                                                                            // "${productList[0]['name']}\n\$${productList[0]['price']}",
                                                                            maxLines: null,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: CustomTextStyles.displayMediumAmberA700))),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgPikachu1,
                                                                    height:
                                                                        304.v,
                                                                    width:
                                                                        323.h,
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    margin: EdgeInsets.only(
                                                                        right: 31
                                                                            .h,
                                                                        bottom:
                                                                            20.v)),
                                                                Positioned(
                                                                  right: 70,
                                                                  bottom:
                                                                      80, // Sesuaikan dengan posisi yang diinginkan
                                                                  child:
                                                                      CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgImage7, // Ganti dengan path gambar listrik Anda
                                                                    height:
                                                                        304.v,
                                                                    width: 323
                                                                        .h, // Sesuaikan dengan lebar gambar
                                                                  ),
                                                                ),
                                                              ])))
                                                ])))
                                  ])))),
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
                      color: appTheme.amberA700,
                      borderRadius: BorderRadius.circular(20.h)))),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse11Yellow500,
              height: 82.v,
              width: 137.h,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 51.h)),
          CustomImageView(
              imagePath: ImageConstant.imgEllipse11Yellow500,
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

  /// Navigates to the pikachuStatScreen when the action is triggered.
  onTapImgBook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pikachuStatScreen);
  }
}
