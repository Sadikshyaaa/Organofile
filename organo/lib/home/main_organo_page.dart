import 'package:flutter/material.dart';
import 'package:organo/home/Organo_page_body.dart';
import 'package:organo/utlis/color.dart';


import 'package:organo/widgets/big_text.dart';
import 'package:organo/widgets/small_text.dart';


class MainOrganoPage extends StatefulWidget {
  const MainOrganoPage({super.key});

  @override
  State<MainOrganoPage> createState() => _MainOrganoPageState();
}

class _MainOrganoPageState extends State<MainOrganoPage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: Column(
         children: [
         Container(
          child: Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Organo", color: AppColors.maincolor),
                    Row(
                      children: [
                        SmallText(text: "Pokhara", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    child: Icon(Icons.search, color: Colors.white),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.maincolor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(
          child: OrganoPageBody(),
        )), 
      ],
    )
    );
  }
}



