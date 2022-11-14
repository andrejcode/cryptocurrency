// Mocks generated by Mockito 5.3.2 from annotations
// in cryptocurrency/test/data/repositories/coin_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cryptocurrency/data/datasources/coin_remote_data_source.dart'
    as _i4;
import 'package:cryptocurrency/data/models/coin_detail_model.dart' as _i3;
import 'package:cryptocurrency/data/models/coin_model.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCoinDetailModel_1 extends _i1.SmartFake
    implements _i3.CoinDetailModel {
  _FakeCoinDetailModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CoinRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinRemoteDataSourceImpl extends _i1.Mock
    implements _i4.CoinRemoteDataSourceImpl {
  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);
  @override
  _i5.Future<List<_i6.CoinModel>> getCoinsFromApi() => (super.noSuchMethod(
        Invocation.method(
          #getCoinsFromApi,
          [],
        ),
        returnValue: _i5.Future<List<_i6.CoinModel>>.value(<_i6.CoinModel>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i6.CoinModel>>.value(<_i6.CoinModel>[]),
      ) as _i5.Future<List<_i6.CoinModel>>);
  @override
  _i5.Future<_i3.CoinDetailModel> getCoinDetailFromApi(
          {required String? coinId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCoinDetailFromApi,
          [],
          {#coinId: coinId},
        ),
        returnValue:
            _i5.Future<_i3.CoinDetailModel>.value(_FakeCoinDetailModel_1(
          this,
          Invocation.method(
            #getCoinDetailFromApi,
            [],
            {#coinId: coinId},
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.CoinDetailModel>.value(_FakeCoinDetailModel_1(
          this,
          Invocation.method(
            #getCoinDetailFromApi,
            [],
            {#coinId: coinId},
          ),
        )),
      ) as _i5.Future<_i3.CoinDetailModel>);
}