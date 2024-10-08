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
  final LocaleService _localeService;

  AuthRemoteDataSourceImpl(
    this._appHttpService,
    this._localeService,
  );

  @override
  Future<AuthModel> initAuth() async {
    final response = await _appHttpService.request(
      path: ApiRoutes.token,
      type: RequestType.post,
      data: const Identity(grantType: GrantType.clientCredentials).toMap(),
      queryParameters: {
        "culture": _localeService.languageCode,
      },
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
      queryParameters: {
        "email": email,
        "culture": _localeService.languageCode,
      },
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
        "culture": _localeService.languageCode,
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
      queryParameters: {
        "culture": _localeService.languageCode,
      },
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
      options: Options(headers: {'UnAuthorizedRequest': 'true'}),
      data: const Identity(grantType: GrantType.refreshToken).toMap()
        ..addAll({'refresh_token': refreshToken}),
      queryParameters: {
        "culture": _localeService.languageCode,
      },
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
      options: Options(
        contentType: 'application/json-patch+json',
      ),
      data: {
        "password": password,
        "userName": login,
      },
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }

  @override
  Future delete() async {
    return await _appHttpService.request(
      path: ApiRoutes.account,
      type: RequestType.delete,
      options: Options(contentType: 'application/json-patch+json'),
      queryParameters: {
        "culture": _localeService.languageCode,
      },
    );
  }
}
