import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/named_element.dart';
import 'package:zimbra_api/src/mail/message/apply_filter_rules_envelope.dart';
import 'package:zimbra_api/src/mail/message/apply_filter_rules_request.dart';
import 'package:zimbra_api/src/mail/type/ids_attr.dart';

void main() {
  final faker = Faker();

  group('Apply filter rules test', (() {
    test('Apply filter rules request', (() {
      final name = faker.lorem.word();
      final ids = faker.lorem.words(3).join(',');
      final query = faker.lorem.word();
      final request = ApplyFilterRulesRequest(
        filterRules: [NamedElement(name: name)],
        msgIds: IdsAttr(ids),
        query: query,
      );

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ApplyFilterRulesRequest': {
            '_jsns': 'urn:zimbraMail',
            'filterRules': {
              'filterRule': [
                {
                  'name': name,
                }
              ]
            },
            'm': {
              'ids': ids,
            },
            'query': {'_content': query},
          }
        },
      });
    }));

    test('Apply filter rules response', (() {
      final ids = faker.lorem.words(3).join(',');
      final json = {
        'Body': {
          'ApplyFilterRulesResponse': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'ids': ids,
            },
          }
        }
      };
      final envelope = ApplyFilterRulesEnvelope.fromJson(json);
    }));
  }));
}
