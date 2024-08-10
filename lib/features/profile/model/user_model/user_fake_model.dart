import 'package:bunny_sync/features/profile/model/modules_model/modules_model.dart';
import 'package:bunny_sync/features/profile/model/options_model/options_model.dart';
import 'package:bunny_sync/features/profile/model/plan_model/plan_model.dart';
import 'package:bunny_sync/features/profile/model/subscription_item_model/subscription_item_model.dart';
import 'package:bunny_sync/features/profile/model/subscription_model/subscription_model.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';

final fakeUser = UserModel(
  id: 51,
  name: 'Kevins',
  email: 'kevin@gmail.com',
  registeredAt: DateTime.now(),
  planId: 1,
  trials: 3,
  subscriptions: [fakeSubscription],
  plan: fakePlan,
);
final fakeSubscription = SubscriptionModel(
  id: 1,
  billableId: 1,
  billableType: 'default',
  type: 'default',
  status: 'active',
  subscriptionDate: DateTime.now(),
  subscribtionItems: [fakeSubscribtionItem],
  isActive: true,
);

const fakePlan = PlanModel(
  id: 1,
  name: 'plan',
  monthlyId: '1',
  yearlyId: '2',
  description: 'this plan is the best one',
  features: [
    'Unlimited Plan',
    'Shedules',
    'Pedigrees',
    'Reports',
    'Notification',
    'Marketplace',
    'Cage Cards',
    'QR Scanner',
    'Attachments',
    'litter',
    'Financial Ledgers',
    'Contact List',
    'Health Tracker',
  ],
  options: fakeOptions,
  archived: 1,
);

final fakeSubscribtionItem = SubscriptionItemModel(
  id: 1,
  subscriptionId: 14,
  productId: '2',
  priceId: '2',
  status: 'active',
  quantity: 1,
  subscriptionDate: DateTime.now(),
  isActive: true,
);

const fakeOptions = OptionsModel(modules: fakeModules);

// Map<String , bool> map = {
//   'limit' : true,
//   'health' : true,
//   'litter' : true,
//   'report' : true,
//   'breeder' : true,
//   'finance' : true,
//   'qrCode' : true,
//   'pedigree' : true,
//   'schedule' : true,
//   'cage_card' : true,
//   'attachment' : true,
//   'marketplace' : true,
//   'contact_list' : true,
//   'notification': true,
// };

const fakeModules = ModulesModel(
  limit: true,
  health: true,
  litter: true,
  report: true,
  breeder: true,
  finance: true,
  qrCode: true,
  pedigree: true,
  schedule: true,
  cageCard: true,
  attachment: true,
  marketPlace: true,
  contactList: true,
  notification: true,
);
