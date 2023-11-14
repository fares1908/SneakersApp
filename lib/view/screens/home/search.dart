import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/homeController.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';
import 'package:sneakerapp/data/models/itemModel.dart';

class Search extends GetView<HomePageControllerImpl> {
  const Search(this.listData, {Key? key}) : super(key: key);
  final List<ItemModel> listData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 20),
          child: Card(
            elevation: 4,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white)),
            child: Container(

              // padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${listData[index].itemsImage}",
                    height: 90,
                  )),
                  Expanded(
                      flex: 2,
                      child: ListTile(

                        title: Text(listData[index].itemsName!,

                          style: TextStyle(

                            fontWeight: FontWeight.w700,
                            fontFamily: 'Raleway',
                            fontSize:
                            35.sp, // Adjust the font size
                            color: Colors.black54,
                          ),
                        ),
                        subtitle: Text(
                          listData[index].categoriesName!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Raleway',
                            fontSize:
                            26.sp, // Adjust the font size
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: listData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
