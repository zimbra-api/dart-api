import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_distribution_list_members_envelope.dart';
import 'package:zimbra_api/src/account/message/get_distribution_list_members_request.dart';
import 'package:zimbra_api/src/account/message/get_distribution_list_members_response.dart';

void main() {
  final faker = Faker();

  group('Get distribution list members tests', (() {
    test('Get distribution list members request', (() {
      final dl = faker.internet.email();
      final limit = faker.randomGenerator.integer(10);
      final offset = faker.randomGenerator.integer(10);
      final request = GetDistributionListMembersRequest(dl, limit: limit, offset: offset);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetDistributionListMembersRequest': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {'_content': dl},
            'limit': limit,
            'offset': offset,
          }
        },
      });
    }));

    test('Get distribution list members response', (() {
      final more = faker.randomGenerator.boolean();
      final total = faker.randomGenerator.integer(100);
      final member = faker.internet.email();
      final seniorityIndex = faker.randomGenerator.integer(10);
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetDistributionListMembersResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'total': total,
            'dlm': [
              {'_content': member}
            ],
            'groupMember': [
              {
                'name': member,
                'seniorityIndex': seniorityIndex,
                '_attrs': {
                  name: value,
                },
              }
            ],
          }
        }
      };
      final envelope = GetDistributionListMembersEnvelope.fromMap(data);
      final response = envelope.body.response as GetDistributionListMembersResponse;

      expect(response.more, more);
      expect(response.total, total);
      expect(response.dlMembers.first, member);

      final groupMember = response.habGroupMembers.first;
      expect(groupMember.name, member);
      expect(groupMember.seniorityIndex, seniorityIndex);

      final attr = groupMember.attrs.first;
      expect(attr.name, name);
      expect(attr.value, value);
    }));
  }));
}
