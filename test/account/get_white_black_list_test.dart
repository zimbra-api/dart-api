import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_white_black_list_envelope.dart';
import 'package:zimbra_api/src/account/message/get_white_black_list_request.dart';
import 'package:zimbra_api/src/account/message/get_white_black_list_response.dart';

void main() {
  final faker = Faker();

  group('Get white black list tests', (() {
    test('Get white black list request', (() {
      final request = GetWhiteBlackListRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetWhiteBlackListRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get white black list response', (() {
      final whiteEntry = faker.lorem.word();
      final blackEntry = faker.lorem.word();
      final data = {
        'Body': {
          'GetWhiteBlackListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'whiteList': {
              'addr': [
                {'_content': whiteEntry}
              ]
            },
            'blackList': {
              'addr': [
                {'_content': blackEntry}
              ]
            },
          }
        }
      };
      final envelope = GetWhiteBlackListEnvelope.fromMap(data);
      final response = envelope.body.response as GetWhiteBlackListResponse;
      expect(response.whiteListEntries.first, whiteEntry);
      expect(response.blackListEntries.first, blackEntry);
    }));
  }));
}
