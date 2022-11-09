import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/auth_response.dart';
import 'package:zimbra_api/src/account_api.dart';

void main() {
  final faker = Faker();

  group('Account api tests', (() {
    test('auth test', (() async {
      final api = AccountApi(
        faker.internet.domainName(),
        httpClientFactory: () => MockClient((request) async {
          return http.Response(
              jsonEncode({
                'Body': {
                  'AuthResponse': {
                    '_jsns': 'urn:zimbraAccount',
                  },
                },
              }),
              200);
        }),
      );

      final response = await api.auth();
      expect(response, isA<AuthResponse>());
    }));
  }));
}
