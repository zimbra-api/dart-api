import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_white_black_list_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_white_black_list_request.dart';
import 'package:zimbra_api/src/account/message/modify_white_black_list_response.dart';
import 'package:zimbra_api/src/common/type/op_value.dart';

void main() {
  final faker = Faker();

  group('Modify white black list tests', (() {
    test('Modify white black list request', (() {
      final op = faker.randomGenerator.element(<String>['+', '-']);
      final whiteEntry = faker.lorem.word();
      final blackEntry = faker.lorem.word();
      final request = ModifyWhiteBlackListRequest(
          whiteListEntries: [OpValue(op: op, value: whiteEntry)],
          blackListEntries: [OpValue(op: op, value: blackEntry)]);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ModifyWhiteBlackListRequest': {
            '_jsns': 'urn:zimbraAccount',
            'whiteList': {
              'addr': [
                {
                  'op': op,
                  '_content': whiteEntry,
                }
              ]
            },
            'blackList': {
              'addr': [
                {
                  'op': op,
                  '_content': blackEntry,
                }
              ]
            },
          }
        }
      });
    }));

    test('Modify white black list response', (() {
      final json = {
        'Body': {
          'ModifyWhiteBlackListResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifyWhiteBlackListEnvelope.fromJson(json);
      expect(envelope.modifyWhiteBlackListBody.modifyWhiteBlackListResponse, isNotNull);
      expect(envelope.modifyWhiteBlackListBody.modifyWhiteBlackListResponse, isA<ModifyWhiteBlackListResponse>());
    }));
  }));
}
