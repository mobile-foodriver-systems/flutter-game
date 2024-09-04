part of 'package:food_driver/features/user/presentation/pages/profile_page.dart';

mixin ProfileMixin on State<ProfileBody> {
  late final UserBloc _bloc = context.read<UserBloc>();
  late final AuthBloc _authBloc = context.read<AuthBloc>();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _bloc.add(const UserLoadProfileEvent());
  }

  void logout() => _authBloc.add(AuthLogoutEvent());

  void deleteAccount() => _authBloc.add(AuthDeleteEvent());

  void changeEditingState() {
    isEditing = !isEditing;
    setState(() {});
  }
}
