import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/auth_envelope.dart';
import 'package:zimbra_api/src/account/message/auth_request.dart';
import 'package:zimbra_api/src/account/message/auth_response.dart';
import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/auth_token.dart';
import 'package:zimbra_api/src/account/type/pre_auth.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';

void main() {
  final faker = Faker();

  group('Auth request tests', () {
    test('Default to data test', () {
      final request = AuthRequest();

      expect(request.toMap(), {'_jsns': 'urn:zimbraAccount'});
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'AuthRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      });
    });

    test('To data test', () {
      final email = faker.internet.email();
      final password = faker.lorem.word();
      final persistAuthTokenCookie = faker.randomGenerator.boolean();
      final csrfSupported = faker.randomGenerator.boolean();
      final recoveryCode = faker.lorem.word();
      final preauthKey = faker.guid.guid();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final expiresTimestamp = faker.randomGenerator.integer(100);
      final token = faker.guid.guid();
      final lifetime = faker.randomGenerator.integer(100);
      final verifyAccount = faker.randomGenerator.boolean();
      final jwtToken = faker.guid.guid();
      final virtualHost = faker.internet.domainName();
      final requestedSkin = faker.lorem.word();
      final twoFactorCode = faker.lorem.word();
      final deviceTrusted = faker.randomGenerator.boolean();
      final trustedDeviceToken = faker.guid.guid();
      final deviceId = faker.guid.guid();
      final generateDeviceId = faker.randomGenerator.boolean();
      final tokenType = faker.lorem.word();
      final ignoreSameSite = faker.randomGenerator.boolean();

      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);
      final permDenied = faker.randomGenerator.boolean();

      final account = AccountSelector(AccountBy.name, email);
      final preauth = PreAuth(account, preauthKey, timestamp: timestamp, expiresTimestamp: expiresTimestamp);
      final authToken = AuthToken(token, lifetime: lifetime, verifyAccount: verifyAccount);
      final prefs = <Pref>[Pref(name, value: value, modified: modified)];
      final attrs = <Attr>[Attr(name, value: value, permDenied: permDenied)];

      final request = AuthRequest(
          account: account,
          password: password,
          persistAuthTokenCookie: persistAuthTokenCookie,
          csrfSupported: csrfSupported,
          recoveryCode: recoveryCode,
          preauth: preauth,
          authToken: authToken,
          jwtToken: jwtToken,
          virtualHost: virtualHost,
          requestedSkin: requestedSkin,
          twoFactorCode: twoFactorCode,
          deviceTrusted: deviceTrusted,
          trustedDeviceToken: trustedDeviceToken,
          deviceId: deviceId,
          generateDeviceId: generateDeviceId,
          tokenType: tokenType,
          ignoreSameSite: ignoreSameSite,
          prefs: prefs,
          attrs: attrs);

      expect(request.toMap(), {
        '_jsns': 'urn:zimbraAccount',
        'persistAuthTokenCookie': persistAuthTokenCookie,
        'csrfTokenSecured': csrfSupported,
        'account': {
          'by': AccountBy.name.name,
          '_content': email,
        },
        'password': {'_content': password},
        'recoveryCode': {'_content': recoveryCode},
        'preauth': {
          'timestamp': timestamp,
          'expires': expiresTimestamp,
          '_content':
              PreAuth.computeValue(account, preauthKey, timestamp: timestamp, expiresTimestamp: expiresTimestamp),
        },
        'authToken': {
          '_content': token,
          'lifetime': lifetime,
          'verifyAccount': verifyAccount,
        },
        'jwtToken': {'_content': jwtToken},
        'virtualHost': {'_content': virtualHost},
        'prefs': {
          'pref': [
            {
              'name': name,
              'modified': modified,
              '_content': value,
            }
          ]
        },
        'attrs': {
          'attr': [
            {
              'name': name,
              'pd': permDenied,
              '_content': value,
            }
          ]
        },
        'requestedSkin': {'_content': requestedSkin},
        'twoFactorCode': {'_content': twoFactorCode},
        'deviceTrusted': deviceTrusted,
        'trustedToken': {'_content': trustedDeviceToken},
        'deviceId': {'_content': deviceId},
        'generateDeviceId': generateDeviceId,
        'tokenType': tokenType,
        'ignoreSameSite': ignoreSameSite,
      });
    });
  });

  group('Auth response tests', () {
    test('Default from data test', () {
      final data = {
        'Body': {
          'AuthResponse': {
            '_jsns': 'urn:zimbraAccount',
          },
        },
      };
      final envelope = AuthEnvelope.fromMap(data);

      expect(envelope.body, isNotNull);
      expect(envelope.body.request, isNull);
      expect(envelope.body.response, isNotNull);
    });

    test('From data test', (() {
      final authToken = faker.guid.guid();
      final lifetime = faker.randomGenerator.integer(100);
      final trustLifetime = faker.randomGenerator.integer(100);
      final sessionId = faker.guid.guid();
      final sessionType = faker.lorem.word();
      final refer = faker.lorem.word();
      final skin = faker.lorem.word();
      final csrfToken = faker.guid.guid();
      final deviceId = faker.guid.guid();
      final trustedToken = faker.guid.guid();
      final zmgProxy = faker.randomGenerator.boolean();
      final twoFactorAuthRequired = faker.randomGenerator.boolean();
      final trustedDevicesEnabled = faker.randomGenerator.boolean();

      final name = faker.lorem.word();
      final value = faker.lorem.word();
      // final modified = faker.randomGenerator.integer(100);
      // final permDenied = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'AuthResponse': {
            '_jsns': 'urn:zimbraAccount',
            'authToken': [
              {
                '_content': authToken,
              }
            ],
            'lifetime': lifetime,
            'trustLifetime': trustLifetime,
            'session': {
              'id': sessionId,
              'type': sessionType,
            },
            'refer': [
              {
                '_content': refer,
              }
            ],
            'skin': [
              {
                '_content': skin,
              }
            ],
            'csrfToken': {
              '_content': csrfToken,
            },
            'deviceId': {
              '_content': deviceId,
            },
            'trustedToken': {
              '_content': trustedToken,
            },
            'zmgProxy': zmgProxy,
            'twoFactorAuthRequired': twoFactorAuthRequired,
            'trustedDevicesEnabled': trustedDevicesEnabled,
            'prefs': {
              '_attrs': {
                name: value,
              },
            },
            'attrs': {
              '_attrs': {
                name: value,
              },
            },
          },
        },
      };
      final envelope = AuthEnvelope.fromMap(data);
      final response = envelope.body.response as AuthResponse;

      expect(response.authToken, authToken);
      expect(response.lifetime, lifetime);
      expect(response.trustLifetime, trustLifetime);
      expect(response.session!.id, sessionId);
      expect(response.session!.type, sessionType);
      expect(response.refer, refer);
      expect(response.skin, skin);
      expect(response.csrfToken, csrfToken);
      expect(response.deviceId, deviceId);
      expect(response.trustedToken, trustedToken);
      expect(response.zmgProxy, zmgProxy);
      expect(response.twoFactorAuthRequired, twoFactorAuthRequired);
      expect(response.trustedDevicesEnabled, trustedDevicesEnabled);

      expect(response.prefs.isNotEmpty, isTrue);
      expect(response.prefs.first.name, name);
      // expect(response.prefs.first.modified, modified);
      expect(response.prefs.first.value, value);

      expect(response.attrs.isNotEmpty, isTrue);
      expect(response.attrs.first.name, name);
      // expect(response.attrs.first.permDenied, permDenied);
      expect(response.attrs.first.value, value);
    }));
  });
}
