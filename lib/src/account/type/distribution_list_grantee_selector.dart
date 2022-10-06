// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/distribution_list_grantee_by.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';

class DistributionListGranteeSelector {
  GranteeType type;

  DistributionListGranteeBy by;

  String? value;

  DistributionListGranteeSelector({this.type = GranteeType.all, this.by = DistributionListGranteeBy.name, this.value});

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'by': by.name,
        if (value != null) '_content': value,
      };
}
