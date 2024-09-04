part of 'package:food_driver/features/user/presentation/pages/profile_page.dart';

mixin ProfileMixin on State<ProfileBody> {
  late final UserBloc _bloc = context.read<UserBloc>();
  late final AuthBloc _authBloc = context.read<AuthBloc>();
  final userRepository = getIt<UserRepository>();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void logout() => _authBloc.add(AuthLogoutEvent());

  void deleteAccount() => _authBloc.add(AuthDeleteEvent());

  void changeEditingState() {
    isEditing = !isEditing;
    setState(() {});
  }

  Future<void> updateProfile({
    String? login,
    String? wallet,
  }) async {
    await userRepository.updateUser(
      userName: login?.isNotEmpty ?? false ? login : null,
      walletAddress: wallet?.isNotEmpty ?? false ? wallet : null,
    );
  }

  void loadProfile() {
    _bloc.add(const UserLoadProfileEvent());
  }
}
