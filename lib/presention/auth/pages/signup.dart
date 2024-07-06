
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/button/basicButton.dart';
import 'package:spotify_app/core/configs/assets/appVector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/common/helpers/isDark.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/domain/usecases/auth/signUp.dart';
import 'package:spotify_app/presention/auth/pages/signIn.dart';
import 'package:spotify_app/presention/root/pages/root.dart';
import 'package:spotify_app/serviceLocator.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
  final TextEditingController _fullNamee=TextEditingController();
  final TextEditingController _Emaill=TextEditingController();
  final TextEditingController _Passwordd=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _SignText(context),
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
            _fullName(
              context
            ),
            SizedBox(height: 20.h,),

            _fullEmail(
              context
            ),
            SizedBox(height: 20.h,),

            _Password(context),
            SizedBox(height: 20.h,),
            BasicButton(onPressed: ()async{
              var result=await s1<SignupUseCase>().call(
                params: CreateUserReq(email: _Emaill.text.toString(), password: _Passwordd.text.toString(), fullName: _fullNamee.text.toString())
              );
              result.fold(
                (l) {
                  var snackbar=SnackBar(content: Text(l));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder:(BuildContext context)=>root()),
                          (route) => false);
                },

              );
            }, title: 'Create Account'),


          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return Text('Register',style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.sp
    ),);

  }
  Widget _fullName(BuildContext context){
    return TextField(
      controller: _fullNamee,
      decoration: const InputDecoration(
        hintText: 'Full Name',

      ).applyDefaults( Theme.of(context).inputDecorationTheme),

    );
  }

  Widget _fullEmail(BuildContext context){
    return TextField(
      controller: _Emaill,
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
  Widget _SignText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,

            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  SignIn(),
              ),
            );
          }, child: Text(
            'Sign In',

          )),
        ],
      ),
    );
  }
}
