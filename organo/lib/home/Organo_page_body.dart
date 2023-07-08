import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:organo/utlis/color.dart';
import 'package:organo/widgets/big_text.dart';
import 'package:organo/widgets/icon_and_text_widget.dart';
import 'package:organo/widgets/small_text.dart';



class OrganoPageBody extends StatefulWidget {
  const OrganoPageBody({Key? key}) : super(key: key);

  @override
   OrganoPageBodyState createState() =>  OrganoPageBodyState();
}

class  OrganoPageBodyState extends State<OrganoPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85 );
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=200;

   @override
   void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        
      });
    });
   }


   @override
   void dispose(){
    pageController.dispose();
   }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      //color: const Color.fromRGBO(255, 82, 82, 1),
      height: 300,
      child: PageView.builder(
        controller: pageController,  
        itemCount: 5,
        itemBuilder: (context, position){
       return _buildPageItem(position);
        }
        ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.maincolor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
),
SizedBox(height: 30,),
Container(
  margin: EdgeInsets.only(left:30),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      BigText(text: "Popular"),
      SizedBox(width:10),
      Container(
        margin: const EdgeInsetsDirectional.only(bottom:3),
        child: BigText(text: ".", color:Colors.black26),
        
      ),
      SizedBox(width:10),
      Container(
        margin: const EdgeInsetsDirectional.only(bottom:2),
        child: SmallText(text: "Product pairing"),
      )
    ],
  ),
),
//list of product and images
Container(
  height: 700,
  child: ListView.builder(
    physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,

  itemCount: 7,
  itemBuilder :(context,index){
    return Container(
      margin: EdgeInsets.only(left:20, right: 20, bottom:10),
      child:Row(
        children: [
          //image section
          Container(
            width: 120,
            height: 120,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Colors.white38,
              image: DecorationImage(
                fit: BoxFit.cover,
                image:AssetImage(
                  "assets/images/Honey.jpg"
                )
              )
            )
          ),
          //text section
          Expanded(
            child: Container(
            height:100,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              color:Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right:10),
            child: Column(
              children: [
                BigText(text: "Organic Honey"),
                SizedBox(height: 5),
                SmallText(text: "Makes your health good"),
                SizedBox(height: 5),

                Row(
                    children: [
                      

                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "100% Organic",
                      iconColor: AppColors.maincolor),

                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "EcoFriendly",
                      iconColor: AppColors.iconcolor2)
                    ],
                  )

              ],
              ),
            ),
          ),
          )
        ],
        ),
     );
  }
  )
  )

      ],  
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if (index== _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);


    }else if(index==_currPageValue.floor()+1){
      var currScale= _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);


    }else if(index==_currPageValue.floor()-1){
      var currScale= 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix =  Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2 , 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
      children: [
        Container(
            height: 220,
            margin: EdgeInsets.only(left:10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                 fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bamboobrush.jpg"
                ),
             ),
           ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height:100,
            margin: EdgeInsets.only(left:30, right:30, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5)

                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0)
                ),
                 BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0)
                 )
              ]
            ),
            child: Container(
              padding: EdgeInsets.only(top:15, left:15, right:15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Bamboo Brush"),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, color:AppColors.maincolor, size: 15))
                      ),
                      SizedBox(width:10),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10),
                      SmallText(text: "1287"),
                      SizedBox(width: 10),
                      SmallText(text: "comments")
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "Normal",
                      iconColor: AppColors.iconcolor1),

                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "Organic",
                      iconColor: AppColors.maincolor),

                      IconAndTextWidget(icon: Icons.circle_sharp, 
                      text: "EcoFriendly",
                      iconColor: AppColors.iconcolor2)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],  
    ),
    );
  }
}