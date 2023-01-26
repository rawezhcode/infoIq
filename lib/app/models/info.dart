class Info {
  int? id;
  String? username;
  String? expiration;
  int? profileId;
  int? clientId;
  String? profileName;
  int? profileUprate;
  int? profileDownrate;
  String? firstName;
  String? lastName;
  String? phone;
  int? type;
  String? clientType;
  double? remainingDays;
  int? remainingDay;
  int? remainingHour;
  int? remainingMinute;
  int? remainingPercentage;
  String? lastRecharge;
  String? cpeExpiry;
  bool? loanIsActivated;
  bool? isRecharge;
  bool? isExpired;
  bool? isLoanEligible;
  bool? speedTestEnable;
  bool? enableSubscriptionPlans;
  bool? enableUserInformation;
  bool? enableEventReminder;
  bool? enableWorldCup;
  bool? enableVIq;

  Info(
      {this.id,
      this.username,
      this.expiration,
      this.profileId,
      this.clientId,
      this.profileName,
      this.profileUprate,
      this.profileDownrate,
      this.firstName,
      this.lastName,
      this.phone,
      this.type,
      this.clientType,
      this.remainingDays,
      this.remainingDay,
      this.remainingHour,
      this.remainingMinute,
      this.remainingPercentage,
      this.lastRecharge,
      this.cpeExpiry,
      this.loanIsActivated,
      this.isRecharge,
      this.isExpired,
      this.isLoanEligible,
      this.speedTestEnable,
      this.enableSubscriptionPlans,
      this.enableUserInformation,
      this.enableEventReminder,
      this.enableWorldCup,
      this.enableVIq});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    expiration = json['expiration'];
    profileId = json['profile_id'];
    clientId = json['client_id'];
    profileName = json['profile_name'];
    profileUprate = json['profile_uprate'];
    profileDownrate = json['profile_downrate'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    type = json['type'];
    clientType = json['client_type'];
    remainingDays = json['remaining_days'];
    remainingDay = json['remaining_day'];
    remainingHour = json['remaining_hour'];
    remainingMinute = json['remaining_minute'];
    remainingPercentage = json['remaining_percentage'];
    lastRecharge = json['last_recharge'];
    cpeExpiry = json['cpe_expiry'];
    loanIsActivated = json['loan_is_activated'];
    isRecharge = json['is_recharge'];
    isExpired = json['is_expired'];
    isLoanEligible = json['is_loan_eligible'];
    speedTestEnable = json['speed_test_enable'];
    enableSubscriptionPlans = json['enable_subscription_plans'];
    enableUserInformation = json['enable_user_information'];
    enableEventReminder = json['enable_event_reminder'];
    enableWorldCup = json['enable_world_cup'];
    enableVIq = json['enable_v_iq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['expiration'] = this.expiration;
    data['profile_id'] = this.profileId;
    data['client_id'] = this.clientId;
    data['profile_name'] = this.profileName;
    data['profile_uprate'] = this.profileUprate;
    data['profile_downrate'] = this.profileDownrate;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['client_type'] = this.clientType;
    data['remaining_days'] = this.remainingDays;
    data['remaining_day'] = this.remainingDay;
    data['remaining_hour'] = this.remainingHour;
    data['remaining_minute'] = this.remainingMinute;
    data['remaining_percentage'] = this.remainingPercentage;
    data['last_recharge'] = this.lastRecharge;
    data['cpe_expiry'] = this.cpeExpiry;
    data['loan_is_activated'] = this.loanIsActivated;
    data['is_recharge'] = this.isRecharge;
    data['is_expired'] = this.isExpired;
    data['is_loan_eligible'] = this.isLoanEligible;
    data['speed_test_enable'] = this.speedTestEnable;
    data['enable_subscription_plans'] = this.enableSubscriptionPlans;
    data['enable_user_information'] = this.enableUserInformation;
    data['enable_event_reminder'] = this.enableEventReminder;
    data['enable_world_cup'] = this.enableWorldCup;
    data['enable_v_iq'] = this.enableVIq;
    return data;
  }
}
