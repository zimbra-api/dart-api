import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/subscribe_distribution_list_envelope.dart';
import 'package:zimbra_api/src/account/message/subscribe_distribution_list_request.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_by.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_subscribe_op.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_subscribe_status.dart';
import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';

void main() {
  final faker = Faker();

  group('Subscribe distribution list tests', (() {
    test('Subscribe distribution list request', (() {
      final dl = faker.internet.email();
      final request = SubscribeDistributionListRequest(DistributionListSelector(DistributionListBy.name, dl),
          op: DistributionListSubscribeOp.subscribe);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SubscribeDistributionListRequest': {
            '_jsns': 'urn:zimbraAccount',
            'op': DistributionListSubscribeOp.subscribe.name,
            'dl': {
              'by': DistributionListBy.name.name,
              '_content': dl,
            },
          }
        },
      });
    }));

    test('Subscribe distribution list response', (() {
      final json = {
        'Body': {
          'SubscribeDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'status': DistributionListSubscribeStatus.subscribed.name,
          }
        }
      };
      final envelope = SubscribeDistributionListEnvelope.fromJson(json);
      final response = envelope.subscribeDistributionListBody.subscribeDistributionListResponse!;
      expect(response.status, DistributionListSubscribeStatus.subscribed);
    }));
  }));
}