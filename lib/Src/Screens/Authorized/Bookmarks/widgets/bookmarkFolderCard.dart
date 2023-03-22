import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bookmarks.dart';
import 'bookmarkCount.dart';

Widget bookmarkFolderCard(bookmarkFolder bookmarkFolder) {
  return GestureDetector(
    onTap: () {
      Get.to(() => bookmarks(), arguments: bookmarkFolder);
    },
    child: Container(
      padding: const EdgeInsets.all(15), // ***** check on that
      decoration: BoxDecoration(
        color: bookmarkFolder.bgColor,
        borderRadius: BorderRadius.circular(tCardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.monitor_heart_rounded,
            color: bookmarkFolder.iconColor,
            size: 35,
          ),
          const SizedBox(height: tDefaultPadding),
          Text(
            bookmarkFolder.title!,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: tDefaultPadding),
          Row(
            children: [
              bookmarkCount(
                  bookmarkFolder.iconColor,
                  bookmarkFolder.btnColor,
                  // ******* add an icon ineastae of "Bookmark"
                  '${bookmarkFolder.count} Bookmark'),
              // ******* can add another btn👍
            ],
          ),
        ],
      ),
    ),
  );
}
