import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_distribution_list_envelope.dart';
import 'package:zimbra_api/src/account/message/get_distribution_list_request.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_by.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';

void main() {
  final faker = Faker();

  group('Get distribution list tests', (() {
    test('Get distribution list request', (() {
      final email = faker.internet.email();
      final needOwners = faker.randomGenerator.boolean();
      final needRights = faker.randomGenerator.boolean();

      final request = GetDistributionListRequest(
        DistributionListSelector(DistributionListBy.name, email),
        needOwners: needOwners,
        needRights: needRights,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetDistributionListRequest': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'by': DistributionListBy.name.name,
              '_content': email,
            },
            'needOwners': needOwners,
            'needRights': needRights,
          }
        },
      });
    }));

    test('Get distribution list response', (() {
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final isDynamic = faker.randomGenerator.boolean();
      final member = faker.internet.email();
      final rightName = faker.lorem.word();

      final json = {
        'Body': {
          'GetDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'name': name,
              'id': id,
              'isOwner': isOwner,
              'isMember': isMember,
              'dynamic': isDynamic,
              'dlm': [
                {'_content': member}
              ],
              'owners': {
                'owner': [
                  {
                    'type': GranteeType.usr.name,
                    'id': id,
                    'name': name,
                  }
                ],
              },
              'rights': {
                'right': [
                  {
                    'right': rightName,
                    'grantee': [
                      {
                        'type': GranteeType.usr.name,
                        'id': id,
                        'name': name,
                      }
                    ],
                  }
                ],
              },
            },
          }
        }
      };
      final envelope = GetDistributionListEnvelope.fromJson(json);
      final response = envelope.getDistributionListBody.getDistributionListResponse!;
      final dl = response.dl!;

      expect(dl.name, name);
      expect(dl.id, id);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);
      expect(dl.isDynamic, isDynamic);
      expect(dl.members.first, member);

      final owner = dl.owners.first;
      expect(owner.type, GranteeType.usr);
      expect(owner.id, id);
      expect(owner.name, name);

      final right = dl.rights.first;
      expect(right.right, rightName);

      final grantee = right.grantees.first;
      expect(grantee.type, GranteeType.usr);
      expect(grantee.id, id);
      expect(grantee.name, name);
    }));
  }));
}
