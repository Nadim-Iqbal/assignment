import 'dart:convert';

import 'package:assignment/app/modules/home/views/offer_details.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../../helpers/app_colors.dart';
import '../../../model/model_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
   List<Product> productsList = [];
   List brandlist = [];
   var responseData;
   List<User> users = [];

   late DetailsList _notification;
   // DetailsList get notification => _notification;

   Future<List<Product>> getRequest2() async {
     productsList.clear();
     //replace your restFull API here.
     String url = "https://dummyjson.com/products";
     final response = await http.get(Uri.parse(url));
     // if(response.statusCode == 200)
     //   {
     //     responseData = DetailsList.fromJson(json.decode(response.body));
     //
     //     final successList = responseData["products"];
     //     print(response.statusCode+successList);
     //     return successList;
     //   }

     responseData = json.decode(response.body);

     final successList = responseData["products"];
     final List<dynamic> citiesAndCounters = [];
     for (var products in successList) {
       Product list = Product(
         brand: products["brand"],
         title: products["title"],
         discountPercentage: products["discountPercentage"],
         price: products["price"],
         thumbnail: products["thumbnail"],
       );
       // Fluttertoast.showToast(msg: list.toString() + "msg");
       productsList.add(list);
     }


     // for (var singleUser in responseData) {
     // User user = User(
     // id: singleUser["id"],
     // userId: singleUser["userId"],
     // title: singleUser["title"],
     // body: singleUser["body"]);
     //
     // //Adding user to the list.
     // users.add(user);
     // }
     // return users;



     // print(response.body);
     print("Iqbal");
     print(responseData);

     //Creating a list to store input data;

     // dynamic? details;
     // details = responseData.products;
     dynamic details;
     // details = respon
     // for (var list in responseData) {
     //   Product detailsList = Product(
     //     brand: list["brand"],
     //     title: list["title"],
     //     discountPercentage: list["discountPercentage"],
     //     price: list["price"],
     //   );

     //Adding user to the list.
     // productsList.add(detailsList);

     //// print("Nadim");
     // print(productsList.length);
     // print(productsList);
     // print(productsList[0].brand+"12");
     return productsList;
   }



   @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('HomeView'),
          //   centerTitle: true,
          // ),
          key: _scaffoldKey,
          drawer:Drawer(
            width: MediaQuery.of(context).size.width - 50,
            child: Container(
              color: Colors.white,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  // GetBuilder<UserController>(builder: (userController) {
                  // return
                  // userController.isLoading
                  // ? Center(
                  //     child: LoadingAnimationWidget.staggeredDotsWave(
                  //       color: Color(0xffD48F65),
                  //       size: 60,
                  //     ),
                  //   )
                  // :
                  DrawerHeader(
                    decoration:  BoxDecoration(
                      color: AppColors.buttonColour,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: 17.h,
                            child: Padding(
                                padding:
                                const EdgeInsets.only(),

                                child: Container(
                                  decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: const CircleBorder (
                                          side: BorderSide(
                                              width: 5,
                                              color: Colors.transparent
                                          )
                                      ) +  const CircleBorder (
                                          side: BorderSide(
                                              width: 2,
                                              color: Colors.white
                                          )
                                      )),
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundImage: const AssetImage("assets/profilepic.png"),
                                      radius: 45,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            top: 70,
                                            left: 50),
                                        child: InkWell(
                                          onTap: () async {
                                            // _showBottomSheet(context);
                                          },
                                          child: const Icon(
                                            Icons.photo,
                                            color: Colors
                                                .transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.19,
                          child: const Padding(
                            padding:  EdgeInsets.only(left: 7),
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "Shubham Kumar",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          "shubhamkumar@cashup.com",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.text),
                        ),
                      ],
                    ),
                  ),
                  // }),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/check_circle_outline.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'My offers',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.arrow_forward_ios,size: 18,),

                        onTap: () {
                          Get.to(OfferDetails(discount: productsList[0].discountPercentage.toString(),image: productsList[0].thumbnail.toString(),brand: productsList[0].brand.toString(), title: productsList[0].title.toString(),));
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/list1.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'App Usage',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.arrow_forward_ios,size: 18,),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/chat1.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Support',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.open_in_new,size: 18,),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/document1.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Terms & Conditions',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.open_in_new,size: 18,),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/setting1.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.open_in_new,size: 18,),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/stars.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Rate Us',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),trailing: const Icon(Icons.arrow_forward_ios,size: 18,),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/lang.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Language',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        trailing: const Text(
                          'ENG',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xffB4B4B4)),
                        ),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: ListTile(
                        leading: Container(
                          // padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Image.asset('assets/logout.png',
                              height: 24, width: 24, color: AppColors.buttonColour),
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),

                        onTap: () {
                        },

                      ),
                    ),
                  ),
                  const Divider(height: 2,),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 6),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // border:
                          // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                          borderRadius:  BorderRadius.all(Radius.circular(6))),
                      child: const Center(
                        child: Text(
                          'Follow us',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 6),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            // border:
                            // Border.all(width: 0.7, color: const Color(0xffCDCDCD)),
                            borderRadius:  BorderRadius.all(Radius.circular(6))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:25 ),
                              child: Image.asset(
                                "assets/fb.png",
                                color: const Color(0xFF3A5A98),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:25 ),
                              child: Image.asset(
                                "assets/insta.png",
                              ),
                            ),
                            Image.asset(
                              "assets/yt.png",
                            ),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height*0.7,
                // margin: EdgeInsets.only(bottom: 50),
                // width: MediaQuery.of(context).size.width,
                color: AppColors.buttonColour,
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
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Image.asset('assets/menu.png',
                                  ),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 15),
                                  child: Text("Hey Shubham",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              width: 100,
                              height: 50,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 30,
                                    child: CircleAvatar(
                                      // backgroundImage: const AssetImage("assets/wallet.png"),
                                      radius: 45,
                                      child: Image.asset("assets/wallet.png",fit: BoxFit.contain),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text("₹ 452",style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.w700),))
                                ],),
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
                      child: ContainedTabBarView(
                        tabBarProperties: const TabBarProperties(
                          unselectedLabelColor: Colors.green,
                          labelColor: Colors.green,
                        ),
                        tabs: const[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(image: AssetImage("assets/category.png")),
                              Text('All Offers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(image: AssetImage("assets/gift.png")),
                              Text('Gifts',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(image: AssetImage("assets/upcoming.png")),
                              Text('Upcoming',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(image: AssetImage("assets/check_circle_outline.png")),
                              Text('My Offers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),),
                            ],
                          ),
                        ],
                        views: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, left: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // Code
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10, left: 0, top: 20,bottom: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/whatshot.png"),
                                           const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text("Trending offers",
                                                style: TextStyle(
                                                    color: Color(0xff7C7C7C),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.27,
                                      width: MediaQuery.of(context).size.width,
                                      child:
                                      // GetBuilder<HomeController>(builder: (homeController) {
                                      //   // List product = Get.find<HomeController>().details;
                                      //     return
                                      FutureBuilder(
                                        future: getRequest2(),
                                          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                                            // print(snapshot.data);
                                            return
                                              productsList.length == 0 ?
                                              Container(
                                                child: Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              )
                                                  : ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount:productsList.length,
                                                  // homeController.details.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, index) {
                                                    // print(controller.productsList.length.toString() + "123");
                                                    // Fluttertoast.showToast(
                                                    //   msg: productsList.length.toString(),
                                                    //   toastLength: Toast.LENGTH_LONG,
                                                    // );
                                                    return InkWell(
                                                      onTap: () {
                                                        Get.to(OfferDetails(discount: productsList[index].discountPercentage.toString(),image: productsList[index].thumbnail.toString(),brand: productsList[index].brand.toString() ,title: productsList[index].title.toString(),));
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 5, left: 0, right: 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    margin : const EdgeInsets.only(right:10),
                                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                                    width: MediaQuery.of(context).size.width * 0.45,
                                                                    decoration:  BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image: NetworkImage(productsList[index].thumbnail.toString()),
                                                                            fit: BoxFit.cover),
                                                                        borderRadius:  BorderRadius.all(
                                                                            Radius.circular((10)))),
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Container(
                                                                        width: MediaQuery.of(context).size.width * 0.45,
                                                                        height: MediaQuery.of(context).size.height * 0.1,
                                                                        decoration: const BoxDecoration(
                                                                            color:  Color(0xff200114),
                                                                            borderRadius:  BorderRadius.only(
                                                                                bottomLeft: Radius.circular(10),
                                                                                bottomRight: Radius.circular(10))),

                                                                        child:  Padding(
                                                                          padding: const EdgeInsets.only(left: 10),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left:5,top: 10,bottom: 5),
                                                                                child: Text(productsList[index].brand.toString(),
                                                                                    style: const TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontSize: 14)),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left:5),
                                                                                child: Text("Get Rs. ${productsList[index].discountPercentage.toString()}",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.w700,
                                                                                        fontSize: 14)),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.only(top: 5),
                                                                                decoration:  const BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 20,
                                                                                      width: 20,
                                                                                      child: Image.asset("assets/flash_on.png",fit: BoxFit.contain),
                                                                                    ),
                                                                                    const Padding(
                                                                                        padding: EdgeInsets.only(right: 5),
                                                                                        child: Text("4,687 users",
                                                                                          style: TextStyle(fontSize: 10,
                                                                                              color: Colors.white,
                                                                                              fontWeight: FontWeight.w500),))
                                                                                  ],),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                ),
                                                                // Text("Check",
                                                                //   style: TextStyle(
                                                                //       color: Clors.black,
                                                                //       fontWeight: FontWeight.w700,
                                                                //       fontSize: 9),
                                                                // )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                          }
                                      )
                                    //   }
                                    // )
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, left: 0, top: 20,bottom: 10),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/apps.png"),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:  Text("More offers",
                                                style: TextStyle(
                                                    color: Color(0xff7C7C7C),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    // height: MediaQuery.of(context).size.height * 0.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: FutureBuilder(
                                          future: getRequest2(),
                                          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                                            // print(snapshot.data);
                                            return
                                              productsList.length == 0 ?
                                              Container(
                                                child: Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                              )
                                                  :ListView.builder(
                                            // physics: const AlwaysScrollableScrollPhysics(),
                                            // scrollDirection: Axis.horizontal,
                                              itemCount: productsList.length,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Get.to(OfferDetails(image: productsList[index].thumbnail.toString(), title: productsList[index].title.toString(), brand: productsList[index].brand.toString(),discount: productsList[index].discountPercentage.toString()));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(left: 0, right: 10, top: 6, bottom: 6),
                                                    child: Container(
                                                      height: 120,
                                                      decoration:  BoxDecoration(
                                                          color: Colors.white,
                                                          border:
                                                          Border.all(width: 1.5, color: const Color(0xff77BB00)),
                                                          borderRadius:  const BorderRadius.all(Radius.circular(6))),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            height:100,
                                                            width: 100,

                                                            margin:const EdgeInsets.only(left:10,top: 5,bottom: 5),

                                                            decoration:  BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(productsList[index].thumbnail.toString()),
                                                                    fit: BoxFit.cover),
                                                                borderRadius: BorderRadius.all(Radius.circular(5))),
                                                            // child: Image.asset('assets/banner.jpeg',fit: BoxFit.fill,height: 95,width: 85,
                                                            // ),
                                                          ),
                                                          Padding(
                                                            padding:const EdgeInsets.only(left:5,top: 5,bottom: 5),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                 Container(
                                                                   width:100,
                                                                   child: Text(productsList[index].brand.toString(),
                                                                      style: const TextStyle(
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontSize: 14)),
                                                                 ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: const Color(0xff1185D5),
                                                                        style: BorderStyle.solid

                                                                    ),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    color: Colors.white,
                                                                  ),
                                                                  width: 100,
                                                                  height: 40,
                                                                  child:  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children:  [
                                                                      Padding(
                                                                          padding: EdgeInsets.only(right: 5),
                                                                          child: Text(" Get ₹${productsList[index].discountPercentage.toString()}",style: TextStyle(fontSize: 16,
                                                                              fontWeight: FontWeight.w700,color: Color(0xff1185D5)),))
                                                                    ],),
                                                                )
                                                              ],
                                                            ),
                                                          ),

                                                          Container(
                                                            decoration: const BoxDecoration(
                                                              color: Colors.white,
                                                            ),
                                                            // width: 100,
                                                            height: 60,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 30,
                                                                  child: Image.asset("assets/flash_on.png",fit: BoxFit.contain),
                                                                ),
                                                                 Padding(
                                                                    padding: EdgeInsets.only(right: 5),
                                                                    child: Text(productsList[index].price.toString(),style: TextStyle(fontSize: 16,color: Color(0xffFF9E0C),
                                                                        fontWeight: FontWeight.w700),))
                                                              ],),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        }
                                      )),


                                  //Code
                                ],
                              ),
                            ),
                          ),
                          Container(color: Colors.white),
                          Container(color: Colors.white),
                          Container(color: Colors.white)
                        ],
                        onChange: (index) => print(index),
                      ),
                    )
                  ],
                ),
              ),

              // const SizedBox(
              //   height: 20,
              // ),

              // const Padding(
              //   padding: EdgeInsets.only(top: 20, bottom: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [],
              //   ),
              // ),
            ],
          ),
        ),
      );

  }
}

class User {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  User({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
}
