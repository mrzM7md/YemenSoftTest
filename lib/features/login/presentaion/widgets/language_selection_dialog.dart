import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemen_soft_test/features/business/app_state_management/app_cubit.dart';

import '../../../../core/enums/languages.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/values/colors.dart';
import '../../../../core/values/images.dart';
import '../../../../core/storage/locall/cache_helper.dart'; // تأكد من بقاء هذا الاستيراد إذا كنت تستخدمه في مكان آخر

class LanguageSelectionAlertDialog extends StatefulWidget {
  const LanguageSelectionAlertDialog({super.key});

  @override
  LanguageSelectionAlertDialogState createState() =>
      LanguageSelectionAlertDialogState();
}

class LanguageSelectionAlertDialogState extends State<LanguageSelectionAlertDialog> {
  Languages selectedLanguage = CacheHelper.getString(key: CacheHelper.lanCacheKey) == 'ar' ? Languages.ARABIC : Languages.ENGLISH;

  @override
  Widget build(BuildContext context) {
    S lan = S.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            lan.choose_language,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(mainAppColor),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [

              _buildLanguageOption(
                  language: lan.arabic,
                  label: 'Arabic',
                  flagAsset: arLanSvgImage,
                  isSelected: selectedLanguage == Languages.ARABIC,
                  onTap: () => setState(() => selectedLanguage = Languages.ARABIC),
                ),

              SizedBox(width: 10.r),

               _buildLanguageOption(
                  language: lan.english,
                  label: 'English',
                  flagAsset: enLanSvgImage,
                  isSelected: selectedLanguage == Languages.ENGLISH,
                  onTap: () => setState(() => selectedLanguage = Languages.ENGLISH),

              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(mainAppColor),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                if (selectedLanguage == Languages.ENGLISH) {
                  CacheHelper.setData(key: CacheHelper.lanCacheKey, value: 'en');
                } else {
                  CacheHelper.setData(key: CacheHelper.lanCacheKey, value: 'ar');
                }
                Navigator.of(context).pop(); // استخدام Navigator.of(context).pop() لإغلاق AlertDialog
                AppCubit.get(context).loadGlobalAppState();
              },
              child: Text(
                lan.apply,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required String language,
    required String label,
    required String flagAsset,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: isSelected ? Colors.greenAccent.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                flagAsset,
                height: 28.h,
                width: 28.w,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    language,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}