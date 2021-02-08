import 'package:dhanda/model/business_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailItemWidget extends StatelessWidget {
  final Data data;

  const CardDetailItemWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag,
              size: 16,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                data.companyName,
                style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                data.address,
                style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 16,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
                child: Row(
                children: data.phones.map((e){
                  return Text(
                    '${e}, ',
                    style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 1.0,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  );
                }).toList()
            )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.person,
              size: 16,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                data.ownerName,
                style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.emoji_transportation,
              size: 16,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              child: Text(
                'Tata - 401, Tata - 301, Tata - 501',
                style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
