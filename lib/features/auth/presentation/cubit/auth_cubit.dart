import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/models/User_type_enum.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  register({required UserTypeEnum userType}) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      User? user = credential.user;
      user?.updateDisplayName(nameController.text);
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailureState('كلمة المرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailureState('البريد الإلكتروني مستخدم بالفعل'));
      } else {
        emit(AuthFailureState('حدث خطأ ما'));
      }
    } catch (e) {
      emit(AuthFailureState('حدث خطأ ما'));
    }
  }
}
