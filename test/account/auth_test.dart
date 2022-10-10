import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/auth_envelope.dart';
import 'package:zimbra_api/src/account/message/auth_request.dart';
import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/auth_token.dart';
import 'package:zimbra_api/src/account/type/pre_auth.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';

void main() {
  final faker = Faker();

  group('Auth request tests', () {
    test('Default to json test', () {
      final request = AuthRequest();

      expect(request.toJson(), {'_jsns': 'urn:zimbraAccount'});
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'AuthRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      });
    });

    test('To json test', () {
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

      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);
      final permDenied = faker.randomGenerator.boolean();

      final account = AccountSelector(AcccountBy.name, email);
      final preauth = PreAuth(account, preauthKey, timestamp: timestamp, expiresTimestamp: expiresTimestamp);
      final authToken = AuthToken(token, lifetime: lifetime, verifyAccount: verifyAccount);
      final prefs = <Pref>[Pref(name, value, modified: modified)];
      final attrs = <Attr>[Attr(name, value, permDenied: permDenied)];

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
          prefs: prefs,
          attrs: attrs);

      expect(request.toJson(), {
        '_jsns': 'urn:zimbraAccount',
        'persistAuthTokenCookie': persistAuthTokenCookie,
        'csrfTokenSecured': csrfSupported,
        'account': {
          'by': AcccountBy.name.name,
          '_content': email,
        },
        'password': password,
        'recoveryCode': recoveryCode,
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
        'jwtToken': jwtToken,
        'virtualHost': virtualHost,
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
        'requestedSkin': requestedSkin,
        'twoFactorCode': twoFactorCode,
        'deviceTrusted': deviceTrusted,
        'trustedToken': trustedDeviceToken,
        'deviceId': deviceId,
        'generateDeviceId': generateDeviceId,
        'tokenType': tokenType,
      });
    });
  });

  group('Auth response tests', () {
    test('Default from json test', () {
      final json = {
        'Body': {
          'AuthResponse': {
            '_jsns': 'urn:zimbraAccount',
          },
        },
      };
      final envelope = AuthEnvelope.fromJson(json);

      expect(envelope.authBody, isNotNull);
      expect(envelope.authBody.authRequest, isNull);
      expect(envelope.authBody.authResponse, isNotNull);
    });

    test('From json test', (() {
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
      final modified = faker.randomGenerator.integer(100);
      final permDenied = faker.randomGenerator.boolean();

      final json = {
        'Body': {
          'AuthResponse': {
            '_jsns': 'urn:zimbraAccount',
            'authToken': {
              '_content': authToken,
            },
            'lifetime': {
              '_content': lifetime,
            },
            'trustLifetime': {
              '_content': trustLifetime,
            },
            'session': {
              'id': sessionId,
              'type': sessionType,
            },
            'refer': {
              '_content': refer,
            },
            'skin': {
              '_content': skin,
            },
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
            'twoFactorAuthRequired': {
              '_content': twoFactorAuthRequired,
            },
            'trustedDevicesEnabled': {
              '_content': trustedDevicesEnabled,
            },
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
          },
        },
      };
      final envelope = AuthEnvelope.fromJson(json);
      final response = envelope.authBody.authResponse!;

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
      expect(response.prefs.first.modified, modified);
      expect(response.prefs.first.value, value);

      expect(response.attrs.isNotEmpty, isTrue);
      expect(response.attrs.first.name, name);
      expect(response.attrs.first.permDenied, permDenied);
      expect(response.attrs.first.value, value);
    }));
  });
}
