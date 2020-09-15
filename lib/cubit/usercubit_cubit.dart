import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:todosin/cubit/UserFormz.dart';

part 'usercubit_state.dart';

class UsercubitCubit extends Cubit<UsercubitState> {
  UsercubitCubit()
      : super(
          UsercubitState(
            status: FormzStatus.pure,
            password: Password.pure(),
            username: Username.pure(),
          ),
        );

  void usernameChange(String value) {
    print(value);
    final username = Username.dirty(value: value);
    print(username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  void passwordChange(String value) {
    final password = Password.dirty(value: value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.username, password]),
      ),
    );
  }

  void resetData() => emit(
        state.copyWith(
          status: FormzStatus.pure,
          password: Password.pure(),
          username: Username.pure(),
        ),
      );
}
