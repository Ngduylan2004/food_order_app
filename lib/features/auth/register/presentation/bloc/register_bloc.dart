import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //lấy đối tượng firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RegisterBloc() : super(RegisterState()) {
    on<RegisterEventNextStep>((event, emit) async {
      try {
        final user = await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);

        //lấy user từ userCredential

        if (user.user != null) {
          //gọi đến firestore để lưu user vào database
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.user!.uid)
              .set({
            'fullName': event.fullName,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
        emit(RegisterSuccess(
          fullName: event.fullName,
          email: event.email,
        ));
      } catch (e) {
        emit(RegisterError(errorMessage: 'đã xảy ra lỗi'));
      }
    });
    // xli stepnext dk
    on<RegisterStepEvent>((event, emit) async {
      if (event.step < 5) {
        final steps = event.step + 1;
        emit(RegisterStep(step: steps));
      }
    });
    on<RegisterStepBackEvent>((event, emit) {
      if (state is RegisterStep && event.step > 0) {
        final steps =
            (state as RegisterStep).step - 1; // Trừ bước từ state hiện tại
        emit(RegisterStep(step: steps)); // Phát sự kiện bước lùi
      }
    });
  }
}
