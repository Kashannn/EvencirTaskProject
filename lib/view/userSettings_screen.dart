import 'package:evencirtaskproject/core/const/app_images.dart';
import 'package:flutter/material.dart';

import '../components/UserSettingRow.dart';
import '../components/appBar.dart';
import '../core/const/app_color.dart';
import '../core/theme/app_text_style.dart';

class UsersettingsScreen extends StatefulWidget {
  const UsersettingsScreen({super.key});

  @override
  State<UsersettingsScreen> createState() => _UsersettingsScreenState();
}

class _UsersettingsScreenState extends State<UsersettingsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Mitt Konto'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //radius of the container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.user),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kashan Ashraf',
                        style: poppins14600.copyWith(color: AppColors.white),
                      ),
                      Text(
                        'kashanashraf5544@gmail.com',
                        style: poppins10400.copyWith(color: AppColors.white),
                      ),
                      Text(
                        '+92 3054294420',
                        style: poppins10400.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // User Setting List with icon
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),

            child: Column(
              children: [
                UserSettingRow(
                  svgAsset: AppImages.setting,
                  name: ' Kontoinstallningar',
                ),
                UserSettingRow(
                  svgAsset: AppImages.payment,
                  name: 'Mina betalmetoder',
                ),
                UserSettingRow(svgAsset: AppImages.support, name: ' Support'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
