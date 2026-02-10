import 'package:flutter/material.dart';
import 'package:house_of_electricity/src/core/presentation/app_colors.dart';
import 'package:house_of_electricity/src/core/presentation/fonts_manager.dart';
import 'package:house_of_electricity/src/core/presentation/sizes.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text('شركة بيت الكهرباء')),
      body: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth),
          ),
          Text(
            'من نحن',
            style: IBMBold(color: AppColors.mainGreen, fontSize: Sizes.s24),
          ),
          Divider(color: AppColors.mainYellow, thickness: 2),
          Text(
            'شركة بيت الكهرباء هي شركة سورية متخصصة في بيع وتوزيع كل ما يتعلق بالمنتجات الكهربائية وتعد اكبر واحدث صالة متخصة في هذا المجال في محافظة حماه وهي مملوكة للأخوان زعبي',
            style: IBMMedium(color: AppColors.mainGreen, fontSize: Sizes.s16),
          ),
          SizedBox(height: Spacing.medium),
          Text(
            'تواصل معنا',
            style: IBMBold(color: AppColors.mainGreen, fontSize: Sizes.s24),
          ),
          Divider(color: AppColors.mainYellow, thickness: 2),
          Row(
            children: [
              Icon(Icons.email, color: AppColors.mainGreen),
              SizedBox(width: Spacing.tiny),
              Text(
                'info@houseofelectricity.com',
                style: IBMMedium(
                  color: AppColors.mainGreen,
                  fontSize: Sizes.s16,
                ),
              ),
            ],
          ),
          SizedBox(height: Spacing.tiny),
          Row(
            children: [
              Icon(Icons.phone, color: AppColors.mainGreen),
              SizedBox(width: Spacing.tiny),
              Text(
                '123 985 452 963+',
                style: IBMMedium(
                  color: AppColors.mainGreen,
                  fontSize: Sizes.s16,
                ),
              ),
            ],
          ),
          SizedBox(height: Spacing.tiny),
          Row(
            children: [
              Icon(Icons.phone, color: AppColors.mainGreen),
              SizedBox(width: Spacing.tiny),
              Text(
                '997 546 251 963+',
                style: IBMMedium(
                  color: AppColors.mainGreen,
                  fontSize: Sizes.s16,
                ),
              ),
            ],
          ),
          SizedBox(height: Spacing.medium),
          Text(
            'موقعنا',
            style: IBMBold(color: AppColors.mainGreen, fontSize: Sizes.s24),
          ),
          Divider(color: AppColors.mainYellow, thickness: 2),
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.mainGreen),
              SizedBox(width: Spacing.tiny),
              Text(
                'سوريا - حماه - شارع صلاح الدين',
                style: IBMBold(color: AppColors.mainGreen, fontSize: Sizes.s16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
