import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_app/common/widgets/button/basicButton.dart';
import 'package:spotify_app/core/configs/assets/appImages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets/appVector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/themes/appColor.dart';

import '../../chooseMode/pages/choosemode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40.h,
              horizontal: 40.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.introBG,

                )
              )
            ),

          ),
          Container(
            color: Colors.black.withOpacity(0.10),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(   vertical: 40.h,horizontal: 40.h),
            child: Column(
              children: [
                Align(
                  alignment:Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVector.logo,
                  ),
                ),
                Spacer(),
                Text(
                  'Enjoy Listining To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 21.h,),
                Text(
                  'Tune in to the rhythm of your soul. Let the music play and your worries fade away. Music is life, thats why our hearts have beats. Lose yourself in the melodies. Where words fail, music speaks. Feel the beat, live the moment. Escape into the sound. Dance like nobody\$s watching. Find your harmony. Turn up the volume of happiness.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppcColor.grey,
                    fontSize: 13.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h,),
                BasicButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const chooseMode(),
                    ),
                  );

                }, title: 'Get Started'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
