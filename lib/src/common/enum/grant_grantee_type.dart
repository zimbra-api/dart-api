// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum GrantGranteeType {
  /// access is granted to an authenticated user
  usr,

  /// access is granted to a group of users
  grp,

  /// access is granted to users on a cos
  cos,

  /// access is granted to public. no authentication needed.
  pub,

  /// access is granted to all authenticated users
  all,

  /// access is granted to all users in a domain
  dom,

  /// access is granted to a non-Zimbra email address and a password
  guest,

  /// access is granted to a non-Zimbra email address and an accesskey
  key;
}
