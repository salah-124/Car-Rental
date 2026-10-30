import 'package:car_rental/features/auth/cubit/auth_cubit.dart';
import 'package:car_rental/features/auth/signup_view.dart';
import 'package:car_rental/features/home/home_view.dart';
import 'package:car_rental/shared/coustom_button.dart';
import 'package:car_rental/shared/coustom_text.dart';
import 'package:car_rental/shared/coustom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AuthCubit>();
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              }
              if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Gap(80),
                        Image.asset('assets/logo.png', height: 200),
                        Gap(30),
                        CoustomText(
                          text: 'Car Rental',
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                        Gap(30),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: CoustomText(
                            text: 'Welcome Back...!',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Gap(50),
                        CoustomTextFeild(
                          hintText: 'Email',
                          controller: cubit.emailController,
                        ),
                        Gap(20),
                        CoustomTextFeild(
                          hintText: 'Password',
                          controller: cubit.passwordController,
                          obscureText: true,
                        ),
                        Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CoustomButton(
                              text: 'LogIn',
                              onTap: () => cubit.login(
                                email: cubit.emailController.text.trim(),
                                password: cubit.passwordController.text,
                              ),
                            ),
                            CoustomButton(
                              text: 'SignUp',
                              onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupView(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.copyright, color: Colors.grey.shade500),
                            Gap(10),
                            CoustomText(
                              text: 'Salah Ayman',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        Gap(50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final SupaService supaService = SupaService();
  // Future<void> login() async {
  //   if (formKey.currentState!.validate()) {
  //     try {
  //       final data = await supaService.signIn(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       );
  //       if (data.user != null) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => AdminView()),
  //         );
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text(e.toString())));
  //     }
  //   }
  // }