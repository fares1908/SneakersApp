import 'package:flutter/material.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Container(
        width: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: tapped ? AppColor.primaryColor : Colors.white, // Change color when tapped
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              color: tapped ? Colors.white : Colors.black54, // Change text color when tapped
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
