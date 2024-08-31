import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/data/models/registration_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/registration/registration_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/base_auth_page.dart';
import 'package:food_driver/features/auth/presentation/pages/mixins/error_mixin.dart';
import 'package:food_driver/features/auth/presentation/widgets/registration.dart';

class RegistrationPage extends StatelessWidget with ErrorMixin {
  const RegistrationPage({super.key});

  static MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => const RegistrationPage(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegistrationBloc>(),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: errorListener,
        builder: (BuildContext context, RegistrationState state) {
          return BaseAuthPage(
            isLoading: state.status == RegistrationStatus.loading,
            child: const Registration(),
          );
        },
      ),
    );
  }
}
