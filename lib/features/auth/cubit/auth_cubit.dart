import 'package:bloc/bloc.dart';
import 'package:car_rental/services/supa_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SupaService supaService = SupaService();

  // SignUp

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    if (formKey.currentState!.validate()) {
      try {
        final data = await supaService.signUp(email: email, password: password);
        emit(AuthSuccess());
      } catch (e) {
        String message = 'Somthing Went Wrong';
        message = e.toString();
        emit(AuthError(message));
      }
    }
  }

  // logIn

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    if (formKey.currentState!.validate()) {
      try {
        final data = await supaService.signIn(email: email, password: password);
        emit(AuthSuccess());
      } catch (e) {
        String message = 'Somthing Went Wrong';
        message = e.toString();
        emit(AuthError(message));
      }
    }
  }
}
