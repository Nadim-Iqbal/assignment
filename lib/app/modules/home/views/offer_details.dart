import 'package:assignment/app/modules/home/controllers/offer_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';


import '../../../helpers/app_colors.dart';
import '../bindings/home_binding.dart';
import '../controllers/home_controller.dart';
import 'home_view.dart';

class OfferDetails extends GetView<OfferDetailsController> {
  final String image;
  final String title;
  final String brand;
  final String discount;
  OfferDetails({Key? key,required this.image, required this.title, required this.brand, required this.discount}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        key: _scaffoldKey,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              color: AppColors.buttonColour,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 25,left: 20, right: 16),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.off(HomeView());
                                  },
                                  child: const Icon(Icons.arrow_back_outlined,color: Colors.white,)
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 15),
                                  child: Text("Offer detail",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 25,left: 4,right: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.none
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            // Code

                            SizedBox(
                              // height: MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 0, right: 10, top: 6, bottom: 6),
                                  child: Container(
                                    height: 120,
                                    decoration:  const BoxDecoration(
                                        color: Colors.white,
                                        // border:
                                        // Border.all(width: 1.5, color: const Color(0xff77BB00)),
                                        borderRadius:  BorderRadius.all(Radius.circular(6))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:100,
                                          width: 100,

                                          margin:const EdgeInsets.only(left:10,top: 5,bottom: 5),

                                          decoration:  BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(image),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(Radius.circular(5))),
                                          // child: Image.asset('assets/banner.jpeg',fit: BoxFit.fill,height: 95,width: 85,
                                          // ),
                                        ),
                                         Padding(
                                          padding:const EdgeInsets.only(left:15,top: 5,bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                               Padding(
                                                padding:  EdgeInsets.only(top: 5),
                                                child:  Text(brand,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16)),
                                              ),
                                              Container(
                                                width:150,
                                                margin: const EdgeInsets.only(top: 10),
                                                child:  Text(title,
                                                    style: TextStyle(
                                                        color: Color(0xff9E9E9E),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10)
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: SmoothStarRating(
                                                    allowHalfRating: false,
                                                    // onRatingChanged: (v) {
                                                    //   rating = v;
                                                    //   setState(() {});
                                                    // },
                                                    starCount: 5,
                                                    rating: 3.5,
                                                    size: 20.0,
                                                    filledIconData: Icons.star,
                                                    halfFilledIconData: Icons.star,
                                                    color: Colors.yellow,
                                                    borderColor: Colors.grey,
                                                    spacing:0.0
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),

                            Divider(height: 10,color: Colors.grey[300],),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, left: 0, top: 20,bottom: 10),
                              child: InkWell(
                                onTap: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child:  Text("Steps (1/4)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 2,
                                    color: Colors.green
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0,left: 20, right: 16),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 30,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              // backgroundImage: const AssetImage("assets/wallet.png"),
                                              radius: 45,
                                              child: Image.asset("assets/check.png",fit: BoxFit.contain),
                                            ),
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.only(left: 15),
                                            child: Text("Install the application",
                                              style: TextStyle(color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.lineThrough),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.none
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.green,
                                        ),
                                        width: 70,
                                        height: 40,
                                        child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            Padding(
                                                padding: EdgeInsets.only(right: 5),
                                                child: Text("₹20",style: TextStyle(fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                                ))
                                          ],),
                                      ),
                                    ],
                                  )),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              // height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 2,
                                    color: const Color(0xffF5970A)
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20, right: 16,bottom: 10),
                                  child:  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 30,
                                                child: CircleAvatar(
                                                  backgroundColor: const Color(0xffF5970A),
                                                  // backgroundImage: const AssetImage("assets/wallet.png"),
                                                  radius: 45,
                                                  child: Image.asset("assets/hourglass.png",fit: BoxFit.contain),
                                                ),
                                              ),
                                              const Padding(
                                                padding:  EdgeInsets.only(left: 15),
                                                child: Text("Complete 3 offers",
                                                  style: TextStyle(color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  style: BorderStyle.none
                                              ),
                                              borderRadius: BorderRadius.circular(30),
                                              color: const Color(0xffF5970A),
                                            ),
                                            width: 70,
                                            height: 40,
                                            child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [

                                                Padding(
                                                    padding: EdgeInsets.only(right: 5),
                                                    child: Text("₹20",style: TextStyle(fontSize: 12,
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.white),
                                                    ))
                                              ],),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 13),
                                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                                        style: TextStyle(color: Color(0xFF9E9E9E),fontSize: 12,fontWeight: FontWeight.w400),
                                          ),
                                      )
                                    ],
                                  )),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffF4F4F4),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0,left: 20, right: 16),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 30,
                                            child: const CircleAvatar(
                                              backgroundColor: Color(0xffE0E0E0),
                                              // backgroundImage: const AssetImage("assets/wallet.png"),
                                              radius: 45,
                                            ),
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.only(left: 15),
                                            child: Text("Refer Workstation to friend",
                                              style: TextStyle(color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.lineThrough),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.none
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        width: 50,
                                        height: 30,
                                        child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            Padding(
                                                padding: EdgeInsets.only(right: 4),
                                                child: Text("₹20",style: TextStyle(fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff1185D5)),
                                                ))
                                          ],),
                                      ),
                                    ],
                                  )),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffF4F4F4),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 0,left: 20, right: 16),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 30,
                                            child: const CircleAvatar(
                                              backgroundColor: Color(0xffE0E0E0),
                                              // backgroundImage: const AssetImage("assets/wallet.png"),
                                              radius: 45,
                                            ),
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.only(left: 15),
                                            child: Text("Withdraw first amount",
                                              style: TextStyle(color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.lineThrough),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              style: BorderStyle.none
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        width: 50,
                                        height: 30,
                                        child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            Padding(
                                                padding: EdgeInsets.only(right: 4),
                                                child: Text("₹20",style: TextStyle(fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff1185D5)),
                                                ))
                                          ],),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15,bottom: 15),
                              decoration:  const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assets/flash_on.png",fit: BoxFit.contain),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text("23,567 users has already participated",
                                        style: TextStyle(fontSize: 14,
                                            color: Color(0xffFF9E0C),
                                            fontWeight: FontWeight.w500),))
                                ],),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Get.off(HomeView());
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient:
                                    const LinearGradient(colors: [Color(0xff1185D5), Color(0xff33C1EF)]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Get ₹${discount}',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            )
                            //Code
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
