// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_camera_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyCameraController on _MyCameraController, Store {
  final _$photoAtom = Atom(name: '_MyCameraController.photo');

  @override
  File? get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(File? value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  @override
  String toString() {
    return '''
photo: ${photo}
    ''';
  }
}
