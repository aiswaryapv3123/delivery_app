import 'package:delivery_app/src/models/get_notifications.dart';
import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/models/get_recent_orders.dart';
import 'package:delivery_app/src/models/login_request.dart';
import 'package:delivery_app/src/models/login_response.dart';
import 'package:equatable/equatable.dart';

abstract class DeliveryStates extends Equatable {
  const DeliveryStates();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// order list
class OrderInitialState extends DeliveryStates {}

class OrderLoadingState extends DeliveryStates {}

class OrderLoadedState extends DeliveryStates {
  GetOrderList getOrderList;
  OrderLoadedState({required this.getOrderList});
}

class OrderErrorState extends DeliveryStates {
  String? error;
  OrderErrorState({this.error});
}
/// order history list
class OrderHistoryInitialState extends DeliveryStates {}

class OrderHistoryLoadingState extends DeliveryStates {}

class OrderHistoryLoadedState extends DeliveryStates {
  GetOrderList getOrderHistoryList;
  OrderHistoryLoadedState({required this.getOrderHistoryList});
}

class OrderHistoryErrorState extends DeliveryStates {
  String? error;
  OrderHistoryErrorState({this.error});
}

/// recent order list
class RecentOrderInitialState extends DeliveryStates {}

class RecentOrderLoadingState extends DeliveryStates {}

class RecentOrderLoadedState extends DeliveryStates {
  GetRecentOrder getRecentOrder;
  RecentOrderLoadedState({required this.getRecentOrder});
}

class RecentOrderErrorState extends DeliveryStates {
  String? error;
  RecentOrderErrorState({this.error});
}

/// notifications
class NotificationsInitialState extends DeliveryStates {}

class NotificationsLoadingState extends DeliveryStates {}

class NotificationsLoadedState extends DeliveryStates {
  GetNotifications getNotifications;
  NotificationsLoadedState({required this.getNotifications});
}

class NotificationsErrorState extends DeliveryStates {
  String? error;
  NotificationsErrorState({this.error});
}
