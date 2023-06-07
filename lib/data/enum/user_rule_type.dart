enum UserRuleType { admin, user, unknown }

UserRuleType getUserRuleTypeByName(String name) {
  switch (name) {
    case 'ROLE_ADMIN':
      return UserRuleType.admin;
    case 'ROLE_USER':
      return UserRuleType.user;
    default:
      return UserRuleType.unknown;
  }
}

String getNameByUserRuleType(UserRuleType userRuleType) {
  switch (userRuleType) {
    case UserRuleType.admin:
      return 'ROLE_ADMIN';
    case UserRuleType.user:
      return 'ROLE_USER';
    default:
      return 'unknown';
  }
}
