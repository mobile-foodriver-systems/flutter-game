part of "auth_remote_data_source.dart";

@LazySingleton(
  as: AuthRemoteDataSource,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppHttpService _appHttpService;

  AuthRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<AuthModel> initAuth() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.token,
      type: RequestType.post,
      data: const Identity(grantType: GrantType.clientCredentials).toMap(),
    );
    print("AAA response: = ${response.toString()}");
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<bool> getConfirmationCode({
    required String email,
  }) async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.post,
      queryParameters: {"email": email},
    );
    return response.statusCode == 200;
  }

  @override
  Future<AuthModel> getAuthModel({
    required String email,
    required String code,
  }) async {
    final response = await _appHttpService.request(
      path: '',
      type: RequestType.post,
      queryParameters: {
        "email": email,
        "code": code,
      },
    );
    return AuthModel.fromJson(jsonDecode(response.data));
  }

  @override
  Future<Response<dynamic>> getAuthModelByPassword({
    required String login,
    required String password,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.token,
      type: RequestType.post,
      data: const Identity(
        grantType: GrantType.password,
        scope: 'foodriver.game.api openid offline_access',
      ).toMap()
        ..addAll({
          'username': login,
          'password': password,
        }),
    );
  }

  @override
  Future<void> logout() async {
    // await _appHttpService.request(
    //   path: '',
    //   type: RequestType.post,
    // );
  }

  @override
  Future<AuthModel> updateAuthModel({required String refreshToken}) async {
    final response = await _appHttpService.request(
      path: ApiRoutes.token,
      type: RequestType.post,
      data: const Identity(grantType: GrantType.refreshToken).toMap()
        ..addAll({'refresh_token': refreshToken}),
    );
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<Response<dynamic>> registration({
    required String login,
    required String password,
  }) async {
    return await _appHttpService.request(
      path: ApiRoutes.account,
      type: RequestType.post,
      options: Options(contentType: 'application/json-patch+json'),
      data: {
        "password": password,
        "userName": login,
      },
    );
  }

  @override
  Future delete() async {
    return await _appHttpService.request(
      path: ApiRoutes.account,
      type: RequestType.delete,
      options: Options(contentType: 'application/json-patch+json'),
    );
  }
}
