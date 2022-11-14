import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/distribution_list_action_envelope.dart';
import 'package:zimbra_api/src/account/message/distribution_list_action_request.dart';
import 'package:zimbra_api/src/account/message/distribution_list_action_response.dart';
import 'package:zimbra_api/src/account/type/distribution_list_action.dart';
import 'package:zimbra_api/src/account/type/distribution_list_grantee_selector.dart';
import 'package:zimbra_api/src/account/type/distribution_list_right_spec.dart';
import 'package:zimbra_api/src/account/type/distribution_list_subscribe_req.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_by.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_grantee_by.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_subscribe_op.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/common/enum/operation.dart';
import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';

void main() {
  final faker = Faker();

  group('Distribution list action tests', (() {
    test('Distribution list action request', (() {
      final name = faker.internet.email();
      final newName = faker.internet.email();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final bccOwners = faker.randomGenerator.boolean();
      final member = faker.internet.email();
      final right = faker.lorem.word();

      final request = DistributionListActionRequest(
          DistributionListSelector(DistributionListBy.name, name),
          DistributionListAction(
            Operation.modify,
            newName: newName,
            subsReq: DistributionListSubscribeReq(
              op: DistributionListSubscribeOp.subscribe,
              value: value,
              bccOwners: bccOwners,
            ),
            members: [member],
            owners: [
              DistributionListGranteeSelector(
                type: GranteeType.usr,
                by: DistributionListGranteeBy.name,
                value: value,
              )
            ],
            rights: [
              DistributionListRightSpec(
                right,
                grantees: [
                  DistributionListGranteeSelector(
                    type: GranteeType.usr,
                    by: DistributionListGranteeBy.name,
                    value: value,
                  )
                ],
              )
            ],
            keyValuePairs: [
              KeyValuePair(
                key,
                value: value,
              )
            ],
          ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DistributionListActionRequest': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'by': DistributionListBy.name.name,
              '_content': name,
            },
            'action': {
              'op': Operation.modify.name,
              'newName': newName,
              'subsReq': {
                'op': DistributionListSubscribeOp.subscribe.name,
                '_content': value,
                'bccOwners': bccOwners,
              },
              'dlm': [
                {'_content': member}
              ],
              'owner': [
                {
                  'type': GranteeType.usr.name,
                  'by': DistributionListGranteeBy.name.name,
                  '_content': value,
                }
              ],
              'right': [
                {
                  'right': right,
                  'grantee': [
                    {
                      'type': GranteeType.usr.name,
                      'by': DistributionListGranteeBy.name.name,
                      '_content': value,
                    }
                  ],
                }
              ],
              'a': [
                {
                  'n': key,
                  '_content': value,
                }
              ],
            },
          }
        }
      });
    }));

    test('Distribution list action response', (() {
      final data = {
        'Body': {
          'DistributionListActionResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = DistributionListActionEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<DistributionListActionResponse>());
    }));
  }));
}
