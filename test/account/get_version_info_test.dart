import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_version_info_envelope.dart';
import 'package:zimbra_api/src/account/message/get_version_info_request.dart';

void main() {
  final faker = Faker();

  group('Get version info tests', (() {
    test(' Get version info request', (() {
      final request = GetVersionInfoRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetVersionInfoRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test(' Get version info resonse', (() {
      final fullVersion = faker.lorem.word();
      final release = faker.lorem.word();
      final date = faker.date.dateTime().toString();
      final host = faker.internet.ipv4Address();

      final json = {
        'Body': {
          'GetVersionInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'info': {
              'version': fullVersion,
              'release': release,
              'buildDate': date,
              'host': host,
            },
          }
        }
      };
      final envelope = GetVersionInfoEnvelope.fromJson(json);
      final response = envelope.getVersionInfoBody.getVersionInfoResponse;
      final versionInfo = response!.versionInfo!;

      expect(versionInfo.fullVersion, fullVersion);
      expect(versionInfo.release, release);
      expect(versionInfo.date, date);
      expect(versionInfo.host, host);
    }));
  }));
}
