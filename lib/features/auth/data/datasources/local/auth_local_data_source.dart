import 'dart:convert';

import 'package:food_driver/core/services/local_storage/local_storage_service.dart';
import 'package:food_driver/features/auth/data/models/auth_model.dart';
import 'package:injectable/injectable.dart';

part 'auth_local_data_source_impl.dart';

abstract interface class AuthLocalDataSource {
  Future<AuthModel> getAuthModel();

  Future<void> saveAuthModel({
    required AuthModel authModel,
  });

  Future<void> deleteAuthModel();
}
