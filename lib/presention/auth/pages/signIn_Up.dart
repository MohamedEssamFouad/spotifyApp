import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/isDark.dart';
import 'package:spotify_app/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basicButton.dart';
import 'package:spotify_app/core/configs/assets/appImages.dart';
import 'package:spotify_app/core/configs/assets/appVector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/themes/appColor.dart';
import 'package:spotify_app/presention/auth/pages/signIn.dart';
import 'package:spotify_app/presention/auth/pages/signup.dart';

class SignUpInPage extends StatelessWidget {
  const SignUpInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVector.top,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVector.bottom,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.auth),
          ),
          Align(

            alignment: Alignment.center,

            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children:[
                SvgPicture.asset(AppVector.logo),
                  Text(
                    'Enjoy Listinig To Music',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 21.h,),
                  Text(
                    'Spotify is a propriety swedish audio streaming and media services provider ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppcColor.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 21.h,),
                  Row(
                    children: [
                      Expanded
                        (
                          flex: 1,
                          child: BasicButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SignUp(),
                            ),
                          );
                        },
                        title: 'Register',

                      )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SignIn(),
                            ),
                          );

                        },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color:context.isDarkMode? Colors.white:Colors.black,

                              ),
                            )),
                      ),

                    ],
                  ),


              ],
                  ),
            ),
          ),
        ],
      ),
    );
  }

}
