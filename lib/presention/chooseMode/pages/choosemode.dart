import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_app/presention/auth/pages/signIn_Up.dart';
import 'package:spotify_app/presention/chooseMode/bloc/themeCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/basicButton.dart';
import '../../../core/configs/assets/appImages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/assets/appVector.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/appColor.dart';

class chooseMode extends StatelessWidget {
  const chooseMode({super.key});

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
                      AppImages.ChooseMode,

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
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 21.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff30393C).withOpacity(0.5),
                            ),
                            height: 60.h,
                            width: 60.w,
                            child: SvgPicture.asset(AppVector.moon,fit: BoxFit.none,),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w,),
                    GestureDetector(
                      onTap: (){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);

                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff30393C).withOpacity(0.5),
                            ),
                            height: 60.h,
                            width: 60.w,
                            child: SvgPicture.asset(AppVector.sun,fit: BoxFit.none,),


                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h,),
                BasicButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpInPage(),
                    ),
                  );

                }, title: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
