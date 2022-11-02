// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// License status
enum LicenseStatus {
  notInstalled,
  notActivated,
  inFuture,
  expired,
  invalid,
  licenseGracePeriod,
  activationGracePeriod,
  ok;

  String get name {
    switch (this) {
      case LicenseStatus.notInstalled:
        return 'NOT_INSTALLED';
      case LicenseStatus.notActivated:
        return 'NOT_ACTIVATED';
      case LicenseStatus.inFuture:
        return 'IN_FUTURE';
      case LicenseStatus.expired:
        return 'EXPIRED';
      case LicenseStatus.invalid:
        return 'INVALID';
      case LicenseStatus.licenseGracePeriod:
        return 'LICENSE_GRACE_PERIOD';
      case LicenseStatus.activationGracePeriod:
        return 'ACTIVATION_GRACE_PERIOD';
      case LicenseStatus.ok:
        return 'OK';
    }
  }
}
