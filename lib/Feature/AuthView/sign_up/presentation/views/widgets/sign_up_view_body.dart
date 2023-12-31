import 'package:bagstore/Core/themaing/app_colors.dart';
import 'package:bagstore/Core/Uitls/local_services.dart';
import 'package:bagstore/Core/Uitls/widgets/custom_auth_text_formfield.dart';

import 'package:bagstore/Core/Uitls/widgets/custom_bottom.dart';
import 'package:bagstore/Core/Uitls/widgets/shows_toust_color.dart';
import 'package:bagstore/Feature/AuthView/sign_up/presentation/manger/register_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignUpViewBody extends StatefulWidget {
  static const String routeName = 'register';
  bool isChecked = false;

  SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var formKey = GlobalKey<FormState>();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          // show the CircularProgressIndicator widget
          showDialog(
              context: context,
              builder: (_) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.whiteColor,
                    ),
                  ));
        } else if (state is RegisterSucess) {
          if (state.bagRegisterModel.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.bagRegisterModel.message!,
              state: ToustState.SUCCESS,
            );
            LocalServices.saveData(
                    key: 'token', value: state.bagRegisterModel.data!.token)
                .then((value) {
              // pushAndFinsh(context, pageName: HomeView.routeName);
            });
          } else {
            Navigator.of(context).pop(); // close the dialog if login fails
            showTouster(
              massage: state.bagRegisterModel.message!,
              state: ToustState.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Full Name',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 15)),
                      ),
                      CustomTextFormFiled(
                        obscureText: false,
                        hintText: 'Name',
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Email',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 15)),
                      ),
                      CustomTextFormFiled(
                        onChanged: (value) {
                          validateEmail(value);
                        },
                        obscureText: false,
                        hintText: 'Patient@self.com',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorManger.redColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 15)),
                      ),
                      CustomTextFormFiled(
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .isPasswordShow,
                        suffixIcon: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .changepasswordVisiability();
                          },
                          child: BlocProvider.of<RegisterCubit>(context).icon,
                        ),
                        hintText: 'Min 8 Cyfr',
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your password';
                          }
                          if (text.length < 8) {
                            return 'Password 8 chars at least';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('phone',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 15)),
                      ),
                      CustomTextFormFiled(
                        obscureText: false,
                        hintText: 'phone',
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.36,
                            child: Checkbox(
                              value: widget.isChecked,
                              activeColor: ColorManger.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: ColorManger.primaryColor,
                                    style: BorderStyle.none,
                                  )),
                              onChanged: (bool? newValue) {
                                setState(() {
                                  widget.isChecked = newValue!;
                                });
                              },
                            ),
                          ),
                          Text(
                            'I agree with Terms and ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'Privacy Policy',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ColorManger.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomBottom(
                        bottomtext: 'Sign Up',
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              widget.isChecked == true) {
                            registerUser(context);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        backgroundColor: ColorManger.primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account?',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.pushNamedAndRemoveUntil(context,
                                //     AuthViewBody.routeName, (route) => false);
                              },
                              child: Text(
                                'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ColorManger.primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
      },
    );
  }

  void registerUser(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).registerUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text);
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        errorMessage = "";
      });
    }
  }
}
