import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileState(user: null, fullName: '')) {
    on<ProfileEvent>((event, emit) async {
      final user = _auth.currentUser;
      final userData =
          await _firestore.collection('users').doc(user?.uid).get();
      final fullName = userData.data()?['fullName'] ?? '';

      emit(ProfileState(user: user, fullName: fullName));
    });
  }
}
