import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_account_distribution_lists_envelope.dart';
import 'package:zimbra_api/src/account/message/get_account_distribution_lists_request.dart';
import 'package:zimbra_api/src/account/message/get_account_distribution_lists_response.dart';
import 'package:zimbra_api/src/common/enum/member_of_selector.dart';

void main() {
  final faker = Faker();

  group('Get account distribution lists tests', (() {
    test('Get account distribution lists request', (() {
      final ownerOf = faker.randomGenerator.boolean();
      final attrs = faker.lorem.words(3).join(',');
      final request = GetAccountDistributionListsRequest(
        ownerOf: ownerOf,
        memberOf: MemberOfSelector.all,
        attrs: attrs,
      );

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetAccountDistributionListsRequest': {
            '_jsns': 'urn:zimbraAccount',
            'ownerOf': ownerOf,
            'memberOf': MemberOfSelector.all.name,
            'attrs': attrs,
          }
        },
      });
    }));

    test('Get account distribution lists request', (() {
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final ref = faker.internet.email();
      final displayName = faker.person.name();
      final isDynamic = faker.randomGenerator.boolean();
      final via = faker.internet.email();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final data = {
        'Body': {
          'GetAccountDistributionListsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': [
              {
                'name': name,
                'id': id,
                'ref': ref,
                'd': displayName,
                'dynamic': isDynamic,
                'via': via,
                'isOwner': isOwner,
                'isMember': isMember,
                'a': [
                  {
                    'n': key,
                    '_content': value,
                  },
                ],
              }
            ],
          },
        },
      };
      final envelope = GetAccountDistributionListsEnvelope.fromMap(data);
      final response = envelope.body.response as GetAccountDistributionListsResponse;

      final dl = response.dlList.first;
      expect(dl.name, name);
      expect(dl.id, id);
      expect(dl.ref, ref);
      expect(dl.displayName, displayName);
      expect(dl.isDynamic, isDynamic);
      expect(dl.via, via);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);

      final attr = dl.attrList.first;
      expect(attr.key, key);
      expect(attr.value, value);
    }));
  }));
}
