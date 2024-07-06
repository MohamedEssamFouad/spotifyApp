

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/button/basicButton.dart';
import 'package:spotify_app/core/configs/assets/appVector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/common/helpers/isDark.dart';
import 'package:spotify_app/data/models/auth/signInUserRE.dart';
import 'package:spotify_app/domain/usecases/auth/signIn.dart';
import 'package:spotify_app/presention/auth/pages/signup.dart';

import '../../../serviceLocator.dart';
import '../../root/pages/root.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
  final TextEditingController _emaill=TextEditingController();
  final TextEditingController _Passwordd=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _SignINText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVector.logo,height: 40.h,width: 40,),
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            _registerText(),
            SizedBox(height: 50.h,),



            _fullEmail(
                context
            ),
            SizedBox(height: 20.h,),

            _Password(context),
            SizedBox(height: 20.h,),
            BasicButton(onPressed: ()async{
              var result=await s1<SignInUseCase>().call(
                  params: SignInUserReQ(email: _emaill.text.toString(), password: _Passwordd.text.toString())
              );
              result.fold(
                    (l) {
                  var snackbar=SnackBar(content: Text(l));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                    (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder:(BuildContext context)=>const root()),
                          (route) => false);
                },

              );
            }, title: 'Sign In'),


          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return Text('Sign In',style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.sp
    ),);

  }


  Widget _fullEmail(BuildContext context){
    return TextField(
      controller: _emaill,
      decoration: const InputDecoration(
        hintText: 'Enter Email',

      ).applyDefaults( Theme.of(context).inputDecorationTheme),

    );
  }
  Widget _Password(BuildContext context){
    return TextField(
      controller: _Passwordd,
      decoration: const InputDecoration(
        hintText: 'Password',

      ).applyDefaults( Theme.of(context).inputDecorationTheme),

    );
  }
  Widget _SignINText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,

            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  SignUp(),
              ),
            );
          }, child: Text(
            'Register Now',

          )),
        ],
      ),
    );
  }
}
